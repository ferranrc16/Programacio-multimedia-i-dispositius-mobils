import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:
          'Recuperar el valor d'
          'un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(controller: myController),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          /* showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(myController.text),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Tancar BottomSheet'),
                          )
                        ],
                      ),
                    ));
              }); */
          /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('AlertDialog'),
                content: Text(myController.text),
                actions: [
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pop(), 
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          ); */
          /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('SimpleDialog'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(myController.text),
                  ),
                ],
              );
            },
          ); */
          /* ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(myController.text),
              duration: const Duration(
                seconds: 2,
              ),
            ),
          ); */
        },
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
