import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget{
  const ContactUs({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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