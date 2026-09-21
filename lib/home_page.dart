import 'package:ecomart/drawer.dart';
import 'package:ecomart/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:ecomart/product.dart";
import "package:ecomart/product_detail_page.dart";
import 'package:ecomart/cart.dart';

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
  void goToCart(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }
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
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: goToCart,
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: signOut,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: SearchAnchor.bar(
              barHintText: 'Search products',
              barElevation: WidgetStateProperty.all(0),
              suggestionsBuilder: 
                (BuildContext context, SearchController controller) {
                  final String input = controller.value.text;
                  return products
                  .where((Product item) => item.name.toLowerCase().contains(input.toLowerCase()))
                  .map((Product filteredItem) =>
                  ListTile(
                    title: Text(filteredItem.name),
                    onTap: () {
                      controller.closeView(filteredItem.name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: filteredItem),
                        ),
                      );
                    },
                  )
                );
              },
            )
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(products.length, (index) {
                final product = products[index];
                String stockText;
                if(product.availability){
                  stockText = "In stock";
                }
                else{
                  stockText = "Out of stock";
                }
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
                      border: Border.all(color: Colors.black, width: 0.01),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            product.image,
                            height: 100,
                          ),
                        ),
                        Text(product.name),
                        Text('\$${product.price}'),
                        Text(stockText),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ]
      )
    );
  }
}