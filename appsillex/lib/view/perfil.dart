import 'package:appsillex/view/editarperfil.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Define el radio de las esquinas
          ),
          title: const Text('Hola, Gonzalo', textAlign: TextAlign.center)),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50, top: 70),
              child: SizedBox(
                height: 170.0,
                width: 170.0,
                child: Image.asset(
                  'assets/letra-g.png',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, top: 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditarProfile()),
                    );
                  },
                  child: const Text(
                    "Editar Perfil",
                    style: TextStyle(
                        fontSize: 34,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
            ),
            const SizedBox(height: 140),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: const Text(
                "Términas y condiciones",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: const Text(
                "Preguntas frecuentes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: const Text(
                "Contáctanos",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: const Text(
                "Ofertas vigentes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 60,
              width: 370,
              margin: const EdgeInsets.only(left: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  child: const Text(
                    "Cerrar sesión",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 150, top: 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditarProfile()),
                    );
                  },
                  child: const Text(
                    "eliminar cuenta",
                    style: TextStyle(
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
