import 'package:flutter/material.dart';
import 'articulos.dart';
import 'perfil.dart';
import 'detalleproductos.dart';

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MenuprincipalState createState() => _MenuprincipalState();
}

class _MenuprincipalState extends State<Menuprincipal> {
  GlobalKey<NavigatorState> menunavigatorKey = GlobalKey<NavigatorState>();
  List<IconData> navbarIcons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.account_circle_outlined,
  ];
  List<Widget> widgets = [
    const Articulos(),
    const DetalleProducto(),
    const Profile(),
  ];

  List<String> bottomNavigationName = ['Home', 'Buy', 'Profile'];

  List<Color> color = [Colors.black, Colors.black, Colors.black];

  List<Color> colorShade = [Colors.yellow, Colors.yellow, Colors.yellow];

  int selectedIndex = 0;
  int previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Navigator(
          key: menunavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            if (settings.name == '/articulos') {
              return MaterialPageRoute(builder: (context) => const Articulos());
            } else if (settings.name == '/detalleproducto') {
              return MaterialPageRoute(
                  builder: (context) => const DetalleProducto());
            } else if (settings.name == '/profile') {
              return MaterialPageRoute(builder: (context) => const Profile());
            }
            return MaterialPageRoute(builder: (context) => widgets[0]);
          },
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 85, right: 85, bottom: 26),
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 70,
          decoration: BoxDecoration(
            color: AppStore().cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(50),
              bottom: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 30,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navbarIcons.map(
              (e) {
                int i = navbarIcons.indexOf(e);
                return GestureDetector(
                  onTap: () {
                    if (i != selectedIndex) {
                      setState(() {
                        previousIndex = selectedIndex;
                        selectedIndex = i;
                      });
                      if (i == 2) {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()))
                            .then((value) {
                          if (value == "back") {
                            selectedIndex = previousIndex;
                          }
                        });
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.all(5),
                    height: 45,
                    decoration: BoxDecoration(
                      color: i == selectedIndex
                          ? colorShade[i]
                          : AppStore().cardColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Icon(
                      e,
                      size: 40,
                      color: i == selectedIndex
                          ? color[i]
                          : const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class AppStore {
  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;

  AppStore() {
    textPrimaryColor = const Color(0xFF212121);
    iconColorPrimaryDark = const Color(0xFF212121);
    scaffoldBackground = const Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = const Color(0xFF131d25);
    appColorPrimaryLightColor = const Color(0xFFF9FAFF);
    textSecondaryColor = const Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = const Color(0xFF212121);
    iconSecondaryColor = const Color(0xFFA8ABAD);
    cardColor = const Color.fromARGB(255, 251, 251, 251);
  }
}
