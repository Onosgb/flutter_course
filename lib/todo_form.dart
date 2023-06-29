import 'package:flutter/material.dart';
import './models/todo.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  SnackBar snackBar(String message) => SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'X',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Task Form')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Enter Description'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    final String title = titleController.text;
                    final String description = descriptionController.text;
                    if (title.isEmpty || description.isEmpty) {
                      if (title.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar('Title can not be empty!'));
                      } else if (description.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBar('Description can not be empty!'));
                      }
                    } else {
                      Navigator.pop(context, Todo(title, description));
                    }
                  },
                  child: const Text('Save'))
            ])
          ],
        ));
  }
}
