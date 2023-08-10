import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Define el radio de las esquinas
          ),
          title: const Text('Iniciar Sesion', textAlign: TextAlign.center)),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50, top: 50),
              child: Text("hola"),
            )
          ],
        ),
      ),
    );
  }
}
