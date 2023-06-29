import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Dialog Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // Initial Var ----> String
  String _inputText = '';
  // void show input dialog
  // AlertDialog
  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // manage the text input filed // controller.text;
          TextEditingController controller = TextEditingController();

          return AlertDialog(
            title: const Text("Enter text"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter some text"),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    setState(() {
                      _inputText = controller.text;
                      Navigator.of(context).pop();
                    });
                  }),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  setState(() {
                    _inputText = controller.text;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // return Scaffold
  // appBar - body (updated State text)  -- Icon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog app')),
      body: Center(
          child: Text(_inputText.isNotEmpty
              ? "You entered: $_inputText"
              : "Tap Icon to enter text")),
      floatingActionButton: FloatingActionButton(
          onPressed: _showInputDialog, child: const Icon(Icons.edit)),
    );
  }
}
