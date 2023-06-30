import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printLastestValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  // method/function void _printLastesValue
  void _printLastestValue() {
    print('third field updated: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Form')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const TextField(
                  decoration: InputDecoration(hintText: 'INPUT ONE'),
                  autofocus: true),
              TextField(
                decoration: const InputDecoration(hintText: 'INPUT TWO'),
                focusNode: myFocusNode,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'INPUT THREE'),
                controller: myController,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myFocusNode.requestFocus();
          },
          tooltip: 'Click me for focus on box two',
          child: const Icon(Icons.star),
        ));
  }
}
