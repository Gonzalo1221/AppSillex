import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class editarprofile extends StatelessWidget {
  editarprofile({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _numeroIdentificacionController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
                  BorderRadius.circular(50), // Define el radio de las esquinas
            ),
            title: const Text('Editar Perfil', style: TextStyle(fontSize: 32))),
        body: Container(
          key: _formKey,
            width: 380,
            margin: EdgeInsets.only(left: 18),
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    }
                  },
                  child: const Text('Finalizar'),
                ),
              ],
            )));
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
