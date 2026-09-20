import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/save_earth.jpg',
                height: 250,
                width: 250,
              )
            ),
            const SizedBox(height: 20),
            Text(
              'About Ecomart',
              style: TextStyle(fontSize: 30)
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Every day, everyday items — toothbrushes, water bottles, food wraps — end up in landfills after a single use. EcoMart exists to make it easier to choose better, without sacrificing convenience or affordability.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Every product on our platform is chosen with the planet in mind: biodegradable materials, sustainably sourced wood, and reusable alternatives that cut down on waste. From a bamboo toothbrush to compostable trash bags, each purchase is a small step toward a cleaner future.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "We're not just a marketplace — we're a community choosing mindful, sustainable living over disposable culture, one product at a time.",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Shop sustainably. Save the earth.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40),
                ]
              )
            )
          ]
        )
      )
    );
  }
}