import 'package:appsillex/screens/editarperfil.dart';
import 'package:flutter/material.dart';
import 'articulos.dart';
import 'perfil.dart';

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({Key? key}) : super(key: key);

  @override
  _MenuprincipalState createState() => _MenuprincipalState();
}

class _MenuprincipalState extends State<Menuprincipal> {
  List<IconData> navbarIcons = [
    Icons.home,
    Icons.shopping_cart_outlined,
    Icons.account_circle_outlined
  ];
  List widgets = <Widget>[
    const Center(
      child: articulos(),
    ),
    const Center(),
    const Center(child: Text("hola"),),
  ];

  List<String> bottomNavigationName = ['Home', 'Buy', 'Profile'];

  List<Color> color = [Colors.black, Colors.black, Colors.black];

  List<Color> colorShade = [Colors.yellow, Colors.yellow, Colors.yellow];

  int selectedIndex = 0;
  int previousIndex = 0; // Agregamos una variable para almacenar el índice anterior

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 16, left: 12, right: 12, top: 8),
        height: 70,
        decoration: BoxDecoration(
          color: appStore.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 50,
              blurRadius: 50,
              offset: Offset(0, 3), // Cambia los valores para ajustar la sombra
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navbarIcons.map(
            (e) {
              int i = navbarIcons.indexOf(e);
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(8),
                height: 45,
                decoration: BoxDecoration(
                  color:
                      i == selectedIndex ? colorShade[i] : appStore.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        child: Icon(
                          e,
                          size: 40,
                          color: i == selectedIndex
                              ? color[i]
                              : const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onTap: () {
                          if (i != selectedIndex) {
                            setState(() {
                              previousIndex = selectedIndex; // Almacenamos el índice anterior
                              selectedIndex = i;
                            });

                            if (i == 2) {
                              // Navegar a la vista de perfil
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => editarprofile()),
                              ).then((value) {
                                // Callback para manejar el regreso desde la vista de perfil
                                if (value == "back") {
                                    selectedIndex = previousIndex; // Restaurar el índice anterior
                                }
                              });
                            }
                          }
                        }),
                    const SizedBox(width: 15),
                    (i == selectedIndex)
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(bottomNavigationName[i],
                                style: TextStyle(
                                    color: color[i],
                                    fontWeight: FontWeight.bold)))
                        : Container(),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();

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
