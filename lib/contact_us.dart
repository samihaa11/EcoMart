import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecomart/profile_page.dart';
import 'package:ecomart/home_page.dart';
import 'package:ecomart/drawer.dart';

class ContactUs extends StatelessWidget{
  const ContactUs({super.key});

  void signOut(BuildContext context) async{
    FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void goToProfilePage(BuildContext context){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const ProfilePage(),
    ),
    );
  }

  void goToHomePage(BuildContext context){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
            'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),

      drawer: MyDrawer(
        onHomeTap: () => goToHomePage(context),
        onProfileTap: () => goToProfilePage(context),
        onSignOut: () => signOut(context),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/contact_us.jpg',
                  height: 250,
                  width: 250,
                )
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              'Have questions or feedback? Feel free to reach out to us through the information below or send us a message.',
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text('support@ecomart.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('+880 0000 567890'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text('Dhaka, Bangladesh'),
            ),
          ],
        ),
      ),
    );
  }
}