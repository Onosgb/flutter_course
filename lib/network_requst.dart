import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/focus_on_form_field.dart';

// Website --> Album JSON --> Dart class --> present the info Flutter

// DART CLASS <-> JSON
//  class Album userId, id, title
// fromJSON --> Dart Object

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  // fatory keyword
  // var myAlbum = Album(1,2,'This is my album');
  // method --> create an instance of object;
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
  }
}
// Function async Future Album (grab from the website)

Future<Album> fetchAlbum(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Faliure to load album');
  }
}

// Flutter App --> Text(Widget)

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;
  final TextEditingController _controller = TextEditingController();

  void _fetchAlbum() {
    int albumId = int.tryParse(_controller.text) ?? 1;

    setState(() {
      futureAlbum = fetchAlbum(albumId);
    });
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'demo',
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(title: const Text("GET HTTP EXAMPLE")),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Album ID Number'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                      onPressed: _fetchAlbum, child: const Text('Submit')),
                  FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!.title);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ]))));
  }
}
