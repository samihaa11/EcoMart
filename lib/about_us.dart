import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/save_earth.jpg',
                  height: 250,
                  width: 250,
                )
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About EcoMart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'EcoMart is your trusted platform for eco-friendly and sustainable products. We aim to bring green living right to your doorstep.',
              style: TextStyle(fontSize: 15, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 25),
            const Text(
              'Meet Our Team',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),


            const Text(
              'Muntasir Rabbi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Bug Slayer & Coder', style: TextStyle(color: Colors.grey)),
            const Divider(height: 25, thickness: 1),

            const Text(
              'Samiha Akter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Layout Wizard', style: TextStyle(color: Colors.grey)),
            const Divider(height: 25, thickness: 1),

            const Text(
              'Tanjil Amin Prantor',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text('Coffee to Code Converter', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}