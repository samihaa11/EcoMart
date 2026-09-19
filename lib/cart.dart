import 'package:flutter/material.dart';

final List<Map<String, dynamic>> cartItems = [
];
 class CartScreen extends StatefulWidget{
   const CartScreen({super.key});
   @override
   State<CartScreen> createState() => _CartScreenState();
 }


class _CartScreenState extends State<CartScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
        iconTheme: const IconThemeData(color : Colors.white),
      ),

      body: cartItems.isEmpty
        ? const Center(
        child: Text(
          'Your Cart is Empty',
          style: TextStyle(fontSize: 20),
        )
      )
          : ListView.builder(
        itemCount: cartItems.length, itemBuilder: (BuildContext context, int index) {
          final item = cartItems[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag, color: Colors.green),
            title: Text(item['name'] ?? 'No Name'),
            subtitle: Text('Price: \$${item['price'] ?? 0}'),
          );
      },
      )
    );
  }
}