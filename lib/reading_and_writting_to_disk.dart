import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(
      MaterialApp(title: 'Demo', home: FlutterDemo(storage: CounterStorage())));
}

class CounterStorage {
  // Get the local path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

// TXT FILE INSIDE of DOC DIR
  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/counter.txt');
  }

// READ WHAT'S INSIDE counter.txt;
  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (error) {
      return 0; // first time superapp is opened!
    }
  }

// WRITE THE COUNT TO count.txt;
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Bar')),
      body: Center(
        child: Text('Button was tapped: $_counter'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter, child: const Icon(Icons.add)),
    );
  }
}
