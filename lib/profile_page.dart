import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomart/home_page.dart';
import 'package:ecomart/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecomart/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void signOut(BuildContext context) async{
  FirebaseAuth.instance.signOut();
  Navigator.popUntil(context, (route) => route.isFirst);
}

void goToHomePage(BuildContext context){
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => const HomePage(),
  ),
  );
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");
  Future<void> editField(String field) async{
    String newValue = "";
    await showDialog(context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[400],
          title: Text("Edit $field"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.white),
            ),
            onChanged: (value){
              newValue = value;
            },
          ),
          actions: [
            TextButton(
              child: Text(
                  'Cancel',
                   style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(newValue),
            ),
          ],
        ),
    );
    if(newValue.trim().length > 0){
      await usersCollection
          .doc(currentUser.email).update({field:  newValue});
    }
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
        foregroundColor: Colors.white,
      ),
        drawer: MyDrawer(
          onHomeTap: () => goToHomePage(context),
          onProfileTap: () {
            Navigator.pop(context);
          },
          onSignOut: () => signOut(context),
        ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email).snapshots(),
          builder: (context, snapShot){
            if(snapShot.hasData){
              final userData = snapShot.data!.data() as Map<String,dynamic>;
               return ListView(
                children: [
                  const SizedBox(height: 95),
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
                    child: Text('My details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  MyTextBox(
                    text: userData['username'],
                    sectionName: 'username',
                    onPressed: () => editField('username'),
                  ),
                  MyTextBox(
                    text: userData['Address'],
                    sectionName: 'Address',
                    onPressed: () => editField('Address'),
                  ),
                ],
              );
            }else if(snapShot.hasError){
              return Center(child: Text('Error${snapShot.error}'),
            );
          }
            return const Center(
            child: CircularProgressIndicator(),
           );
         },
       ),
    );
  }
}
