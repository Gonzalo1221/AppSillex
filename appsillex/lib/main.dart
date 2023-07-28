import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
            Container(
                height: 400,
                width: 400,
                padding: EdgeInsets.only(left: 20.0, top: 50.0),
                child: SizedBox(
                  width: 400, // Ancho deseado
                  height: 400, // Alto deseado
                  child: Image.asset('assets/descarga-removebg-preview.png'),
                )),

            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'Sillex',
                textAlign: TextAlign
                    .center, // Aquí puedes cambiar el texto como desees
                style: TextStyle(
                  fontSize: 38.0,
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
                  fontSize: 20.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                '¡Bienvenido!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 70.0), // Ajustar los valores para mover el botón
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Define el radio de las esquinas
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountMenuprincipal()),
                  );
                },
                child: const Text(
                  'Explorar',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navegar a la segunda página cuando se presione "Crear cuenta"
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
                  fontSize: 18.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateAccountIniciarSesion()),
                );
              },
              child: const Text(
                'Iniciar Sesion',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
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
  final TextEditingController _confirmarContrasenaController = TextEditingController();
  final TextEditingController _numeroIdentificacionController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  

  CreateAccountRegistro({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
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
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Define el radio de las esquinas
                ),
                fixedSize: const Size(10, 40)),
            child: const Text('omitir',
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
                const Text('Nombre',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su nombre',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const Text('Correo',
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

 

                const Text(
                  'Ciudad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                const Text(
                  'Fecha de nacimiento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                const Text('Tipo de identificacion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const TextField(decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
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
                const Text('Celular',
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

                      // Si el formulario es válido, realizar acciones adicionales aquí
                      // Por ejemplo, guardar los datos en una base de datos o enviarlos al servidor
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
}
// void _alerta(BuildContext context) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       child: AlertDialog(
//         title: Text("hola"),
//         context: Text("¿que haces?"),
//         actions: [
//          TextButton(
//             child: Text("No"),
//             onPressed: () {
//               print("no");
//             }),
//           TextButton(
//             child: Text("Siuuu"),
//             onPressed: () {
//               print("Si");
//             },
//             )
//            ],
//            ));
// }

class CreateAccountMenuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sillex')),
      body: const Padding(
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
      body: const Padding(
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

class LExpansionPanelList extends StatefulWidget {
  @override
  _LExpansionPanelListState createState() => _LExpansionPanelListState();
}

class _LExpansionPanelListState extends State<LExpansionPanelList> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (i, isOpen) {
              setState(() {
                if (index == i)
                  index = -1;
                else
                  index = i;
              });
            },
            animationDuration: Duration(seconds: 1),
            dividerColor: Colors.teal,
            elevation: 2,
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("Index 0 (Header Tap Enabled)"),
                  );
                },
                canTapOnHeader: true,
                body: ListTile(
                  title: Text("Notes"),
                  subtitle: const Text('for index 0'),
                ),
                isExpanded: index == 0,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("Index 1"),
                  );
                },
                body: ListTile(
                  title: Text("Notes"),
                  subtitle: const Text('for index 1'),
                ),
                isExpanded: index == 1,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("Index 2 (Header Tap Enabled)"),
                  );
                },
                canTapOnHeader: true,
                body: ListTile(
                  title: Text("Notes"),
                  subtitle: const Text('for index 2'),
                ),
                isExpanded: index == 2,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("Index 3"),
                  );
                },
                body: ListTile(
                  title: Text("Notes"),
                  subtitle: const Text('for index 3'),
                ),
                isExpanded: index == 3,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("Index 4"),
                  );
                },
                body: ListTile(
                  title: Text("Notes"),
                  subtitle: const Text('for index 4'),
                ),
                isExpanded: index == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}