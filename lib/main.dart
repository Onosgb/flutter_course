import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MaterialApp(
      title: 'Demo',
      home: FlutterDemo(
        storage: Storage(),
      )));
}

// Storage

class Storage {
  // Path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // File
  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/input.txt');
  }

  // Read what's inside the counter file
  Future<String> readUserInput() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (error) {
      return '';
    }
  }

  // Write to a File;
  Future<File> writeUserInput(String userInput) async {
    final file = await _localFile;

    return file.writeAsString(userInput);
  }
}

//Statefulwidget

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final Storage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

// State

class _FlutterDemoState extends State<FlutterDemo> {
  final userInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readUserInput().then((value) => {
          setState(() {
            userInputController.text = value;
          })
        });
  }

  @override
  void dispose() {
    super.dispose();
    userInputController.dispose();
  }

  Future<File> _saveUserInput() {
    return widget.storage.writeUserInput(userInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(userInputController.text.isEmpty
                ? 'Demo'
                : userInputController.text)),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: userInputController,
                    decoration: const InputDecoration(labelText: 'Enter text'),
                  ),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _saveUserInput();
              });
            },
            tooltip: 'Save',
            child: const Icon(Icons.save)));
  }
}
// Form TextInput TextEditingController