import 'package:ecomart/drawer.dart';
import 'package:ecomart/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:ecomart/product.dart";
import "package:ecomart/product_detail_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void signOut(){
  FirebaseAuth.instance.signOut();
}

void goToProfilePage(BuildContext context){
 Navigator.pop(context);
 Navigator.push(context, MaterialPageRoute(
     builder: (context) => const ProfilePage(),
 ),
 );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          'Ecomart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: signOut,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    product.image,
                    height: 100,
                  ),
                  Text(product.name),
                  Text('\$${product.price}'),
                  Text('Quantity: ${product.quantity}'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}