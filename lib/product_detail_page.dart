import 'package:flutter/material.dart';
import "package:ecomart/product.dart";
import 'package:ecomart/cart.dart';

class ProductDetail extends StatelessWidget{
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    String stockText;
    if(product.availability){
      stockText = "In stock";
    }
    else{
      stockText = "Out of stock";
    }
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.image,
              height: 250,
              width: 250,
            )
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: TextStyle(fontSize: 30)
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Price: \$${product.price}', style: TextStyle(fontSize: 20)),
              Text('ID: ${product.id}', style: TextStyle(fontSize: 20)),
              Text(stockText, style: TextStyle(fontSize: 20))
            ]
          ),



          const SizedBox(height: 30),
          Container(
            height: 100,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.description,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center
                )
              )
            )
          ),

          const SizedBox(height:20),
          ElevatedButton.icon(
            onPressed: (){
              cartItems.add({
                'name' : product.name,
                'price' : product.price,
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart!'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon (
                Icons.shopping_cart,
                color: Colors.green,
            ),
            label: const Text(
                'Purchase',
                style: TextStyle(color: Colors.black),
            ),
          ),
        ]
      ),
    );
  }
}