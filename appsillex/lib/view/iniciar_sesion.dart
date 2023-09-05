import 'menu_principal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IniciarSesion extends StatelessWidget {
  final TextEditingController logincorreo = TextEditingController();
  final TextEditingController loginpassword = TextEditingController();
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  IniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Define el radio de las esquinas
          ),
          title: const Text('Iniciar Sesion', textAlign: TextAlign.center)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Menuprincipal()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 96, 162)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        alignment: const Alignment(-4, 0),
                        'assets/facebook-emblem.jpg', // Cambia 'logo.png' por el nombre y ubicación real de tu imagen
                        width:
                            32, // Ajusta el ancho de la imagen según tus necesidades
                        height:
                            32, // Ajusta el alto de la imagen según tus necesidades
                      ),
                      const SizedBox(
                          width:
                              8), // Ajusta el espacio entre la imagen y el texto si lo necesitas.
                      const Text(
                          "Iniciar sesión con Facebook"), // Deja el texto "Iniciar sesión con Facebook" aquí para mostrarlo junto con la imagen.
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Menuprincipal()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 21, 130, 219)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        alignment: const Alignment(-4, 0),
                        'assets/google.png', // Cambia 'logo.png' por el nombre y ubicación real de tu imagen
                        width:
                            24, // Ajusta el ancho de la imagen según tus necesidades
                        height:
                            24, // Ajusta el alto de la imagen según tus necesidades
                      ),
                      const SizedBox(
                          width:
                              8), // Ajusta el espacio entre la imagen y el texto si lo necesitas.
                      const Text(
                          "Iniciar sesión con Google"), // Deja el texto "Iniciar sesión con Facebook" aquí para mostrarlo junto con la imagen.
                    ],
                  ),
                ),
                const SizedBox(height: 190),
                const Text(
                  "Correo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller:
                      logincorreo, // Aquí debes usar el controlador logincorreo en lugar de _nombreController, ya que parece ser el controlador que se ha definido
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su correo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Contraseña',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller:
                      loginpassword, // Aquí debes usar el controlador logincorreo en lugar de _nombreController, ya que parece ser el controlador que se ha definido
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              40), // Define el radio de las esquinas
                        ),
                        minimumSize: const Size(10, 40)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Menuprincipal()),
                      );
                    },
                    child: const Text(
                      "Iniciar Sesion",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                const SizedBox(height: 100),
                const TermsAndConditionsWidget(),
                TextButton(
                    onPressed: () {},
                    child: const Text('¿Haz olvidado tu contraseña?',
                        style: TextStyle(color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  final String termsText = 'Términos de servicio';
  final String termsText2 = 'Política de privacidad';
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
          text: 'Si continuas, aceptas los ',
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
            const TextSpan(text: ' y la '),
            TextSpan(
              text: termsText2,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = _launchURL,
            ),
            const TextSpan(text: 'de alquiler de sillas.')
          ],
        ),
      ),
    );
  }
}
