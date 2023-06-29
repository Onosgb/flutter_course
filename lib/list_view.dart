import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final items = ['item1', 'item2', 'item3', 'item4'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Example App",
        home: Scaffold(
            appBar: AppBar(title: const Text('Listview')),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    print('You just tapped on $item');
                  },
                );
              },
            )));
  }
}
