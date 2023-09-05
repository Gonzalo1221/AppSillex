import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> listhorizontal = [
    'objeto one',
    'objeto two',
    'objeto tree',
    'objeto four',
    'objeto five'
  ];
  final List<String> listvertical = [
    'objeto one',
    'objeto two',
    'objeto tree',
    'objeto four',
    'objeto five'
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Listas de diferentes formas',
                style: TextStyle(color: Colors.black)),
          ),
          body: Row(children: [
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listhorizontal.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text(listhorizontal[index]))),
                );
              },
            )),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listvertical.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text(listvertical[index]))),
                );
              },
            ))
          ]),
        ));
  }
}
