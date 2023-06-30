import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final List<Todo> todoList = [
  Todo('Paint House', 'Paint it black'),
  Todo('Pet the dog', 'Use combo to brush as well')
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'App', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  _HomeScreen({Key? key});

  // Initial variable
  String _selection = 'None';

  // user select?

  _StartSelectionScreen() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SelectScreen()));

    setState(() {
      _selection = result ?? "None";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('SELECTION ONE WAS: $_selection'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _StartSelectionScreen,
                child: const Text('Go to Opton Screen '),
              )
            ],
          ),
        ));
  }
}

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select an option')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Option 1");
                },
                child: const Text("Option 1")),
            const SizedBox(height: 2),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Option 2");
                },
                child: const Text("Option 2")),
            const SizedBox(height: 2),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Option 3");
                },
                child: const Text("Option 3"))
          ],
        ));
  }
}
