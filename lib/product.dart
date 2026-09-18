class Product{
  final int id;
  final String name;
  final String image;
  final String category;
  final String description;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.quantity
  });
}

List<Product> products = [
  Product(
    id: 2056,
    name: 'Bamboo Toothbrush',
    image: 'assets/images/bamboo_toothbrush.png',
    category: 'Personal Care',
    description: 'Eco-friendly toothbrush made from sustainable bamboo.',
    price: 3.99,
    quantity: 25,
  ),

  Product(
    id: 3327,
    name: 'Paper Pen',
    image: 'assets/images/bamboo_toothbrush.png',
    category: 'Writing',
    description: 'Black ink pen made from hard paper, easy and comfortable to write with.',
    price: 0.99,
    quantity: 47,
  ),

];