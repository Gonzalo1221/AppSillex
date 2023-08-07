import 'package:flutter/material.dart';

class Menuprincipal extends StatelessWidget {
  const Menuprincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                const SizedBox(width: 225.0), // Espacio entre el texto y la imagen
                SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset(
                    'assets/buscar.png',
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left:30.0,top:10.0),
              padding: EdgeInsets.all(10.0),
              height: 150,
              width: 100,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
