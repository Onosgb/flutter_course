import 'package:flutter/material.dart';
import './models/todo.dart';

final List<Todo> _todoList = [
  Todo('Paint House', 'Paint it black'),
  Todo('Pet the dog', 'Use combo to brush as well')
];

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  State<TodosScreen> createState() => _TodosScreen();
}

class _TodosScreen extends State<TodosScreen> {
  // using the alert method
  void _addTask() async {
    final Todo? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();

          return AlertDialog(
            title: const Text('Add task'),
            content: SizedBox(
                height: 120,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    )
                  ],
                )),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    const Color color = Colors.red;
                    final String title = titleController.text;
                    final String description = descriptionController.text;
                    if (title.isEmpty || description.isEmpty) {
                      if (title.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar('Title can not be empty!', color));
                      } else if (description.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar('Description can not be empty!', color));
                      }
                    } else {
                      Navigator.pop(context, Todo(title, description));
                    }
                  },
                  child: const Text('Save'))
            ],
          );
        });

    if (result != null) {
      setState(() {
        _todoList.add(Todo(result.title, result.description));
        ScaffoldMessenger.of(context).showSnackBar(
            snackBar('Task has been successfully added!', Colors.green));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = _todoList[index];
          return ListTile(
            title: Text(todo.title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: todo)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(todo.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(todo.description),
        ));
  }
}

SnackBar snackBar(String message, Color color) => SnackBar(
      content: Text(message),
      action: SnackBarAction(
        textColor: color,
        label: 'X',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
