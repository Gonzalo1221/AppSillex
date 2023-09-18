import 'package:flutter/material.dart';

class Cambiarcontrasena extends StatelessWidget {
  Cambiarcontrasena({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController =TextEditingController();
  final TextEditingController _confirmarContrasenaController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        title: const Text('Editar Perfil', style: TextStyle(fontSize: 32)),
      ),
      body: Container(
        width: 380,
        margin: const EdgeInsets.only(left: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(right: 0, bottom: 140, top: 10),
                      child: SizedBox(
                        height: 75.0,
                        width: 75.0,
                        child: Image.asset(
                          'assets/letra-g.png',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, bottom: 160),
                      child: const Text(
                        "Hola, Gonzalo\n¿Qué tal tu día?",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Correo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _correoController,
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
                  controller: _contrasenaController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su Contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su Contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Confirmar Contraseña',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _confirmarContrasenaController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su Contraseña nueva',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su Contraseña nueva';
                    }
                    if (value != _contrasenaController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Realiza acciones después de validar el formulario
                    }
                  },
                  child: const Text('Actualizar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
