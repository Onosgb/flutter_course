import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('My Home Page')),
      drawer: const NavigationPage(),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(child: Text('About screen')),
      drawer: const NavigationPage(),
    );
  }
}

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: const Center(child: Text('Users screen')),
      drawer: const NavigationPage(),
    );
  }
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        SizedBox(
          height: 60.0,
          child: DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                'Rentals',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Users'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Users()));
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const About()));
          },
        ),
      ],
    ));
  }
}
