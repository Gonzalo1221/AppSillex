import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
    );
  }
}
class CreateAccountIniciarSesion extends StatelessWidget {
  final TextEditingController logincorreo = TextEditingController();
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CreateAccountIniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Define el radio de las esquinas
          ),
          title: const Text('Iniciar Sesion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Correo',
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
              TextFormField(
                maxLines: 1,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                  hintText: 'Enter UserName',
                  icon: Icon(Icons.person,
                      color: Colors.black), // Utiliza un color específico aquí
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
