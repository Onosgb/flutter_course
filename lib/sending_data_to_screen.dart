import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final List<Todo> todoList = [
  const Todo('Paint House', 'Paint it black'),
  const Todo('Pet the dog', 'Use combo to brush as well')
];

void main() =>
    runApp(MaterialApp(title: 'App', home: TodosScreen(todos: todoList)));

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todos')),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];
            return ListTile(
                title: Text(todo.title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TodoScreen(todo: todo)));
                });
          },
        ));
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(todo.title)),
        body: Center(
          child: Text(todo.description),
        ));
  }
}
