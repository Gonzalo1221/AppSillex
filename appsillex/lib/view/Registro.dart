import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:appsillex/main.dart';

class Registro extends StatelessWidget {
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

  final List<String> listGenero = ['Hombre', 'Mujer', 'Otro'];
  final List<String> listCiudad = ['Barranquilla', 'Soledad', 'Bogotá'];
  final List<String> listTipoIdentificacion = ['C.C', 'T.I', 'Cedula extranjera'];

  Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        title: const Text('Registro'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Omitir',
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                const Text(
                  'Genero',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
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
                  'Ciudad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
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
                  'Tipo de identificacion',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(hintText: 'Seleccione una opcion'),
                  items: listTipoIdentificacion.map((tipoidentificacion) {
                    return DropdownMenuItem(
                      value: tipoidentificacion,
                      child: Text(tipoidentificacion),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
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
