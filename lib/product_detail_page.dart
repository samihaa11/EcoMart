import 'package:flutter/material.dart';
import "package:ecomart/product.dart";

class ProductDetail extends StatelessWidget{
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Image.network(
              product.image,
              height: 250,
              width: 250
            )
          ),
          Center(
            child: Text(
              product.name,
              style: TextStyle(fontSize: 30)
            )
          ),
        ]
      ),
    );
  }
}