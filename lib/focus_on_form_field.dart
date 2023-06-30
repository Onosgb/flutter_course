import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Form')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: 'INPUT ONE'),
                  autofocus: true),
              TextField(
                decoration: InputDecoration(hintText: 'INPUT TWO'),
                focusNode: myFocusNode,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'INPUT THREE'),
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
