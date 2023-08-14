import 'package:flutter/material.dart';
import 'articulos.dart';
import 'perfil.dart';
import 'detalleproductos.dart';
import 'carrito.dart';

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({Key? key}) : super(key: key);

  @override
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
    const articulos(),
    const DetalleProducto(),
    const profile(),
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
              return MaterialPageRoute(builder: (context) => const articulos());
            } else if (settings.name == '/detalleproducto') {
              return MaterialPageRoute(
                  builder: (context) => const DetalleProducto());
            } else if (settings.name == '/profile') {
              return MaterialPageRoute(builder: (context) => const profile());
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
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
              bottom: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 30,
                offset: Offset(0, 1),
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
                                    builder: (context) => const profile()))
                            .then((value) {
                          if (value == "back") {
                            selectedIndex = previousIndex;
                          }
                        });
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.all(5),
                    height: 45,
                    decoration: BoxDecoration(
                      color: i == selectedIndex
                          ? colorShade[i]
                          : AppStore().cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color.fromARGB(255, 251, 251, 251);
  }
}
