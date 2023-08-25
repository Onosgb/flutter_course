import 'package:flutter/material.dart';
import 'package:myapp/models/user_model.dart';

class DatailScreen extends StatelessWidget {
  DatailScreen({Key? key, required this.user}) : super(key: key);
  UserModel user;
  @override
  Widget build(BuildContext context) {
    final fullName = '${user.firstname} ${user.lastname}';

    return Scaffold(
      appBar: AppBar(title: const Text('Details screen')),
      body: SizedBox(
          width: double.infinity,
          height: 250,
          child: Card(
              margin: const EdgeInsets.all(30),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(5, 5))),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    Text(fullName, style: const TextStyle(fontSize: 16)),
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ))),
    );
  }
}
