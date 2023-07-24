import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sillex', // Aquí puedes cambiar el texto como desees
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para procesar el inicio de sesión
              },
              child: Text('Explorar'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navegar a la segunda página cuando se presione "Crear cuenta"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountPage()),
                );
              },
              child: Text('Registro'),
            ),
            TextButton(
              onPressed: () {
                // Lógica para recuperar la contraseña
              },
              child: Text('Iniciar Sesion'),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear cuenta')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulario de creación de cuenta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Aquí puedes agregar campos de texto y widgets adicionales para el formulario de creación de cuenta
          ],
        ),
      ),
    );
  }
}
