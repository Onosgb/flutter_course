import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'List with dialog', home: MyHomePageState());
  }
}

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key});
  @override
  State<MyHomePageState> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePageState> {
  List<String> _todos = ['task', 'task', 'task', 'task', 'task'];

// Dialog Box Pop-up;
// Text input --> add to the _todos;

// ListView.builder --> ListTiles _todos;

  void _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController taskController = TextEditingController();
          return AlertDialog(
            title: const Text('Enter new tab below'),
            content: TextField(
              controller: taskController,
              decoration: const InputDecoration(hintText: 'Enter some text'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  setState(() {
                    _todos.add(taskController.text);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My todo list')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = _todos[index];
          return ListTile(
            title: Text("$todo ${index + 1}",
                style: TextStyle(
                    decoration: todo.startsWith('-')
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
            trailing: IconButton(
              color: Colors.redAccent,
              onPressed: () {
                setState(() {
                  _todos.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete),
            ),
            onTap: () {
              if (todo.startsWith('-')) {
                setState(() {
                  _todos[index] = todo.substring(2);
                });
              } else {
                setState(() {
                  _todos[index] = '- $todo';
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _addTodo, child: const Icon(Icons.add)),
    );
  }
}
