import 'package:flutter/material.dart';

class DetalleProducto extends StatelessWidget {
  const DetalleProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Container(
                margin: const EdgeInsets.only(left: 150, top: 100),
                child: const Text(
                  "Artículos:",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ]),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 150, top: 5),
                    child: const Text(
                      "Sillas Gamers",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 50.0, top: 10.0),
                  height: 250,
                  width: 150,
                  child: Column(
                    // Usamos Column como contenedor de múltiples hijos
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/packsillas.png'),
                      const Text('Descripción del producto'),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al hacer clic en el botón
                        },
                        child: const Text('Comprar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
