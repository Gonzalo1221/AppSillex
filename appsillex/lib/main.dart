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
      body: Container(
        color: Color(0xFFEDE7DD), // Set the background color to red
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Agrega la imagen como fondo utilizando Image.asset
            Expanded(
              child: Image.asset(
                'assets/descarga-removebg-preview.png',
                // fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              'Sillex',
              textAlign:
                  TextAlign.center, // Aquí puedes cambiar el texto como desees
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sillas elegantes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '¡Bienvenido!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountMenuprincipal()),
                );
              },
              child: Text('Explorar'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navegar a la segunda página cuando se presione "Crear cuenta"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountRegistro()),
                );
              },
              child: Text('Registro'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountIniciarSesion()),
                );
              },
              child: Text('Iniciar Sesion'),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountRegistro extends StatelessWidget {
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

class CreateAccountMenuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sillex')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulario de Menu principal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Aquí puedes agregar campos de texto y widgets adicionales para el formulario de creación de cuenta
          ],
        ),
      ),
    );
  }
}

class CreateAccountIniciarSesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesion')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulario de Iniciar Sesion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Aquí puedes agregar campos de texto y widgets adicionales para el formulario de creación de cuenta
          ],
        ),
      ),
    );
  }
}
