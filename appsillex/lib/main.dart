// import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/MenuPrincipal.dart';
import 'screens/Registro.dart';
import 'screens/IniciarSesion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEDE7DD), // Set the background color to red
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Agrega la imagen como fondo utilizando Image.asset
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/descarga-removebg-preview.png',
                fit: BoxFit.cover,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'Sillex',
                textAlign: TextAlign
                    .center, // Aquí puedes cambiar el texto como desees
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'Sillas elegantes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                '¡Bienvenido!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6.0),

            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 70.0), // Ajustar los valores para mover el botón
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        40), // Define el radio de las esquinas
                  ),
                  minimumSize:
                      const Size(250, 60), // Ajusta el tamaño mínimo del botón
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Menuprincipal()),
                  );
                },
                child: const Text(
                  'Explorar',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alineación central horizontal
              children: [
                TextButton(
                  onPressed: () {
                    // Navegar a la segunda página cuando se presione "Registro"
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Registro()),
                    );
                  },
                  child: const Text(
                    'Registro',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(
                    width: 10), // Un pequeño espacio entre los botones
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IniciarSesion()),
                    );
                  },
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Un pequeño espacio entre los botones
            const TermsAndConditionsWidget(),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  final String termsText = 'Términos y condiciones';
  final String termsUrl = 'https://www.example.com';

  const TermsAndConditionsWidget(
      {super.key}); // Reemplaza con la URL real de tus términos y condiciones

  _launchURL() async {
    // ignore: deprecated_member_use
    var canLaunch2 = canLaunch(termsUrl);
    if (await canLaunch2) {
      // ignore: deprecated_member_use
      await launch(termsUrl);
    } else {
      throw 'No se pudo abrir la URL $termsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Agregamos el Center para centrar el texto
      child: RichText(
        text: TextSpan(
          text: 'Acepto los ',
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: termsText,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = _launchURL,
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
