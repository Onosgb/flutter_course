import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Roboto'),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(appTitle),
              centerTitle: true,
            ),
            body: const MyCustomForm()));
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TextField(
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(hintText: 'Enter Text'),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Text Form Field',
                prefixIcon: const Icon(Icons.person, size: 30),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
