import 'package:flutter/material.dart';
import 'cambiarcontraseña.dart';

class EditarProfile extends StatefulWidget {
  @override
  _EditarProfileState createState() => _EditarProfileState();
}

class _EditarProfileState extends State<EditarProfile> {
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
        title: Text('Editar Perfil', style: TextStyle(fontSize: 32)),
      ),
      body: Container(
        width: 380,
        margin: EdgeInsets.only(left: 18),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 0, bottom: 140),
                    child: SizedBox(
                      height: 75.0,
                      width: 75.0,
                      child: Image.asset(
                        'assets/letra-g.png',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 160),
                    child: Text(
                      "Hola, Gonzalo\n¿Qué tal tu día?",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, bottom: 30),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cambiarcontrasena()),
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
              Text(
                'Nombre',
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
              SizedBox(height: 10),
              Text(
                'Genero',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(hintText: 'Seleccione una opción'),
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
              SizedBox(height: 10),
              Text(
                'Fecha de nacimiento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _datePickerDialog(context),
                decoration: InputDecoration(
                  hintText: 'Selecciona una fecha',
                  labelText: 'Fecha de nacimiento',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tipo de identificación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(hintText: 'Seleccione una opción'),
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
              SizedBox(height: 10),
              Text(
                'Número de identificación',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _numeroIdentificacionController,
                decoration: InputDecoration(
                  hintText: 'Ingrese su identificación',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su identificación';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'Ciudad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(hintText: 'Seleccione una opción'),
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
                child: Text('Finalizar'),
              ),
            ],
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
