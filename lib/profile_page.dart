import 'package:ecomart/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  Future<void> editField(String field) async{
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          Icon(
            Icons.person,
            size: 72,
          ),

          const SizedBox(height: 10),

          Text(
              currentUser.email!,
              textAlign: TextAlign.center,
          ),

          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text('My details'),
          ),
          MyTextBox(
              text: 'koko',
              sectionName: 'username',
              onPressed: () => editField('username'),
          ),
          MyTextBox(
            text: '',
            sectionName: 'Address',
            onPressed: () => editField('Address'),
          ),
        ],

      ),
    );
  }
}
