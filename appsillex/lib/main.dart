import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
                            const CreateAccountMenuprincipal()),
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
                          builder: (context) => CreateAccountRegistro()),
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
                          builder: (context) => CreateAccountIniciarSesion()),
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

class CreateAccountRegistro extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarContrasenaController =
      TextEditingController();
  final TextEditingController _numeroIdentificacionController =
      TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  CreateAccountRegistro({super.key});

  List listgenero = ['Hombre', 'Mujer', 'Otro'];
  List listciudad = ['barranquilla', 'Soledad', 'bogota'];
  List listtipoidentificacion = ['C.C', 'T.I', 'Cedula extranjera'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(60), // Define el radio de las esquinas
        ),
        title: const Text('Registro'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ); // Acción al hacer clic en el botón
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    30), // Define el radio de las esquinas
              ),
            ),
            child: const Text(
              'omitir',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Nombre',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su nombre',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su nombre';
                    }
                    return null;
                  },
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
                const Text(
                  'Genero',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
                  items: listgenero.map((genero) {
                    return DropdownMenuItem(
                      value: genero,
                      child: Text(genero),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const Text(
                  'Ciudad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
                  items: listciudad.map((ciudad) {
                    return DropdownMenuItem(
                      value: ciudad,
                      child: Text(ciudad),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const Text(
                  'Fecha de nacimiento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _datePickerDialog(context),
                  decoration: const InputDecoration(
                    hintText: 'Selecciona una fecha',
                    labelText: 'Fecha de nacimiento',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tipo de identificacion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
                  items: listtipoidentificacion.map((tipoidentificacion) {
                    return DropdownMenuItem(
                      value: tipoidentificacion,
                      child: Text(tipoidentificacion),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const Text(
                  'Numero de identificacion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _numeroIdentificacionController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su identificacion',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su identificacion';
                    }
                    return null;
                  },
                ),
                const Text(
                  'Celular',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _celularController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su numero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su numero de celular';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showAlertDialog(context);
                    }
                  },
                  child: const Text('Finalizar'),
                ),
                // Aquí puedes agregar campos de texto y widgets adicionales para el formulario de creación de cuenta
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _datePickerDialog(BuildContext context) {
    final DateTime now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((DateTime? onValue) {
      if (onValue != null) {
        _dateController.text = _formatDate(onValue);
      }
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()}';
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Mensaje'),
        content: const Text('¡Registro Exitoso!'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('ok'),
          )
        ],
      ),
    );
  }
}

class CreateAccountMenuprincipal extends StatelessWidget {
  const CreateAccountMenuprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 0.0,
                  top: 10.0), // Mover el texto 20 píxeles hacia la izquierda
              child: Text(
                'Sillex',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountIniciarSesion extends StatelessWidget {
  final TextEditingController logincorreo = TextEditingController();
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  CreateAccountIniciarSesion({super.key});

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
                        builder: (context) => CreateAccountMenuprincipal()),
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
                        builder: (context) => CreateAccountMenuprincipal()),
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
                              const CreateAccountMenuprincipal()),
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

  // void _signInWithGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       await _auth.signInWithCredential(credential);
  //       // Luego de iniciar sesión, puedes navegar a la siguiente pantalla o realizar alguna acción.
  //     }
  //   } catch (e) {
  //     print("Error en inicio de sesión con Google: $e");
  //   }
  // }

  // void _signInWithFacebook(BuildContext context) async {
  //   try {
  //     final AccessToken? result = (await FacebookAuth.instance.login()) as AccessToken?;
  //     if (result != null) {
  //       // Si la autenticación fue exitosa, puedes obtener los datos del usuario.
  //       final userData = await FacebookAuth.instance.getUserData();
  //       print("Datos del usuario: $userData");
  //       // Luego de obtener los datos, puedes navegar a la siguiente pantalla o realizar alguna acción.
  //     }
  //   } catch (e) {
  //     print("Error en inicio de sesión con Facebook: $e");
  //   }
  // }
}
