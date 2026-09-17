import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          child: const Text('Sign Out'),
          ),
        ]
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: TextTheme.of(context).headlineSmall,
            ),
          );
        }),
      )
    );
  }
}