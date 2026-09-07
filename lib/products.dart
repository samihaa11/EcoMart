class Product {
  final String id;
  final String name;
  final String type;
  final double price;
  final int stock;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.stock,
    required this.description,
    required this.imageUrl,
  });
}

// Sample products with generated images
final List<Product> sampleProducts = [
  const Product(
    id: 'p1',
    name: 'Bamboo Toothbrush',
    type: 'Brush',
    price: 3.99,
    stock: 25,
    description:
        'A simple toothbrush made from robust bamboo. A brilliant alternative to plastic options.',
    imageUrl: 'https://images.unsplash.com/photo-1607613009820-a29f7bb81c04?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p2',
    name: 'Paper Pen',
    type: 'Writing',
    price: 4.49,
    stock: 40,
    description:
        'A pen made from hard carboard like paper and organic ink. Easy to hold, excellent to write with.',
    imageUrl: 'https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p3',
    name: 'Whole Wheat Bread',
    type: 'Bakery',
    price: 2.99,
    stock: 0,
    description:
        'Soft, freshly baked whole wheat bread made with 100% whole grain flour. No preservatives added.',
    imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p4',
    name: 'Organic Baby Spinach (200g)',
    type: 'Vegetables',
    price: 2.49,
    stock: 18,
    description:
        'Tender organic baby spinach leaves, washed and ready to eat. Ideal for salads and smoothies.',
    imageUrl: 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p5',
    name: 'Fibre Bag',
    type: 'Storage',
    price: 1.79,
    stock: 32,
    description:
        'A sturdy and fashionable shopping bag made of jute fibre. Easy to carry loads with.',
    imageUrl: 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p6',
    name: 'Sparkling Orange Juice (1L)',
    type: 'Beverages',
    price: 3.29,
    stock: 15,
    description:
        'Refreshing sparkling juice made from freshly squeezed oranges. No added sugar.',
    imageUrl: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p7',
    name: 'Earthen Water Bottle',
    type: 'Bottle',
    price: 5.99,
    stock: 22,
    description:
        'A water bottle made of fine soil and crafted with amazing pottery.',
    imageUrl: 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p8',
    name: 'Cherry Tomatoes (500g)',
    type: 'Vegetables',
    price: 2.99,
    stock: 0,
    description:
        'Sweet, juicy cherry tomatoes perfect for salads, pasta, or snacking straight from the box.',
    imageUrl: 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p9',
    name: 'Bamboo Chair',
    type: 'Furniture',
    price: 3.49,
    stock: 27,
    description:
        'A medium sized chair for any room in a house, decorated with beautiful patterns.',
    imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p10',
    name: 'Metal Straw',
    type: 'Utensils',
    price: 0.50,
    stock: 50,
    description:
        'Small metal straw, usable with any bottle or glass. Reusable and long lasting.',
    imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p11',
    name: 'Fibre Basket',
    type: 'Storage',
    price: 4.99,
    stock: 12,
    description:
        'Light weight basket, good for holding any object, easy to clean.',
    imageUrl: 'https://images.unsplash.com/photo-1616046229478-9901c5536a45?w=600&auto=format&fit=crop&q=80',
  ),
  const Product(
    id: 'p12',
    name: 'Sourdough Loaf',
    type: 'Bakery',
    price: 4.29,
    stock: 9,
    description:
        'Traditional slow-fermented sourdough with a crisp crust and airy crumb. Baked fresh daily.',
    imageUrl: 'https://images.unsplash.com/photo-1589367920969-ab8e050bbb04?w=600&auto=format&fit=crop&q=80',
  ),
];