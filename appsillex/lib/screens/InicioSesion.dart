import 'package:flutter/material.dart';
import 'MenuPrincipal.dart';


class IniciarSesion extends StatelessWidget {
  final TextEditingController logincorreo = TextEditingController();
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  IniciarSesion({super.key});
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

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
                    backgroundColor: Color.fromARGB(255, 21, 130, 219)),
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
              const Text(
                'Contraseña',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller:
                    logincorreo, // Aquí debes usar el controlador logincorreo en lugar de _nombreController, ya que parece ser el controlador que se ha definido
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Menuprincipal()),
                    );
                  },
                  child: const Text("Iniciar Sesion")),
              const Text(
                  'Si continuas, aceptas los Términos de servicio y la Política de privacidad de Alquiler de Sillas.')
            ],
          ),
        ),
      ),
    );
  }
}