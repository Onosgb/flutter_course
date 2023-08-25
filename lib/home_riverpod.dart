import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/user_model.dart';

import 'data_provider.dart';
import './screens/detail_screen.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: data.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();

            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: ListTile(
                          title: Text(userList[index].firstname,
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(userList[index].lastname,
                              style: const TextStyle(color: Colors.white)),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatar),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DatailScreen(user: userList[index]))),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
