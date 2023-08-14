import 'package:flutter/material.dart';
import 'detalleproductos.dart';
import 'carrito.dart';

class articulos extends StatelessWidget {
  const articulos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DemoMWAppBarScreen(
                                initialCategory: 'Comedor',
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                    height: 250,
                    width: 150,
                    child: Column(
                      // Usamos Column como contenedor de múltiples hijos
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/packsillas.png'),
                        const Text('Sillas de Comedor'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50.0, top: 10.0),
                  height: 250,
                  width: 150,
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
                  child: Column(
                    // Usamos Column como contenedor de múltiples hijos
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/sillaseventos.png'),
                      const Text('Sillas de Evento'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 50.0, top: 10.0),
                  height: 250,
                  width: 150,
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
    );
  }
}
