import 'package:flutter/material.dart';
import 'cambiar_contrasena.dart';

class EditarProfile extends StatefulWidget {
  const EditarProfile({super.key});

  @override
  EditarProfileState createState() => EditarProfileState();
}

class EditarProfileState extends State<EditarProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _numeroIdentificacionController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  List<String> listGenero = ['Hombre', 'Mujer', 'Otro'];
  List<String> listCiudad = ['Barranquilla', 'Soledad', 'Bogotá'];
  List<String> listTipoIdentificacion = ['C.C', 'T.I', 'Cedula extranjera'];

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
                    Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 30),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Cambiarcontrasena()),
                            );
                          },
                          child: const Text(
                            "cambiar contraseña",
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          )),
                    ),
                  ],
                ),
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
                const SizedBox(height: 10),
                const Text(
                  'Genero',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opción'),
                  items: listGenero.map((genero) {
                    return DropdownMenuItem(
                      value: genero,
                      child: Text(genero),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
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
                  'Tipo de identificación',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opción'),
                  items: listTipoIdentificacion.map((tipoIdentificacion) {
                    return DropdownMenuItem(
                      value: tipoIdentificacion,
                      child: Text(tipoIdentificacion),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Número de identificación',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _numeroIdentificacionController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su identificación',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su identificación';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ciudad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opción'),
                  items: listCiudad.map((ciudad) {
                    return DropdownMenuItem(
                      value: ciudad,
                      child: Text(ciudad),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Realiza acciones después de validar el formulario
                    }
                  },
                  child: const Text('Finalizar'),
                ),
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
}
