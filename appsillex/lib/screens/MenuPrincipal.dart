import 'package:flutter/material.dart';

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
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 2.0,
                  top: 10.0,
                ),
                child: Text(
                  'Sillex',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 225.0), // Espacio entre el texto y la imagen
              SizedBox(
                height: 30.0,
                width: 30.0,
                child: Image.asset(
                  'assets/buscar.png',
                ),
              ),
            ],
          ),
          const SizedBox(height: 33),
          const Text(
            "Articulo:",
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                height: 250,
                width: 150,
                color: Colors.amber,
                  child: Column(
                  // Usamos Column como contenedor de múltiples hijos
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/packsillas.jpg'),
                    const Text('Sillas de Comedor'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, top: 10.0),
                height: 250,
                width: 150,
                color: Colors.amber,
                  child: Column(
                  // Usamos Column como contenedor de múltiples hijos
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/sillasoficina.png'),
                    const Text('Sillas de Oficina'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                height: 250,
                width: 150,
                color: Colors.amber,
                  child: Column(
                  // Usamos Column como contenedor de múltiples hijos
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/sillaseventos.jpg'),
                    const Text('Sillas de Evento'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, top: 10.0),
                height: 250,
                width: 150,
                color: Colors.amber,
                child: Column(
                  // Usamos Column como contenedor de múltiples hijos
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/Silla-Gamer-Roja.png'),
                    const Text('Sillas Gamers'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 33),
          const Text(
            "Articulo:",
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 50.0, top: 10.0),
            height: 250,
            width: 150,
            color: Colors.amber,
            child: Column(
              // Usamos Column como contenedor de múltiples hijos
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/Silla-Gamer-Roja.png'),
                Text('Descripción del producto'),
                ElevatedButton(
                  onPressed: () {
                    // Acción al hacer clic en el botón
                  },
                  child: Text('Comprar'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    const Center(
        child: Text("Profile View",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  List<String> bottomNavigationName = ['Home', 'Buy', 'Profile'];

  List<Color> color = [Colors.black, Colors.black, Colors.black];

  List<Color> colorShade = [Colors.yellow, Colors.yellow, Colors.yellow];

  int selectedIndex = 0;

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
                          selectedIndex = i;
                          setState(() {});
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
