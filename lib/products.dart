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

// Placeholder products 
final List<Product> sampleProducts = [
  const Product(
    id: 'p1',
    name: 'Fresh Organic Apples (1kg)',
    type: 'Fruits',
    price: 3.99,
    stock: 25,
    description:
        'Crisp, juicy organic apples sourced fresh from local farms. Great for snacking, baking, or juicing.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p2',
    name: 'Farm Fresh Eggs (12 pack)',
    type: 'Dairy & Eggs',
    price: 4.49,
    stock: 40,
    description:
        'Free-range eggs collected daily from pasture-raised hens. Rich in protein and perfect for any meal.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p3',
    name: 'Whole Wheat Bread',
    type: 'Bakery',
    price: 2.99,
    stock: 0,
    description:
        'Soft, freshly baked whole wheat bread made with 100% whole grain flour. No preservatives added.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p4',
    name: 'Organic Baby Spinach (200g)',
    type: 'Vegetables',
    price: 2.49,
    stock: 18,
    description:
        'Tender organic baby spinach leaves, washed and ready to eat. Ideal for salads and smoothies.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p5',
    name: 'Whole Milk (1L)',
    type: 'Dairy & Eggs',
    price: 1.79,
    stock: 32,
    description:
        'Creamy, farm-fresh whole milk pasteurized for quality and safety. A pantry staple.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p6',
    name: 'Sparkling Orange Juice (1L)',
    type: 'Beverages',
    price: 3.29,
    stock: 15,
    description:
        'Refreshing sparkling juice made from freshly squeezed oranges. No added sugar.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p7',
    name: 'Roasted Almonds (250g)',
    type: 'Snacks',
    price: 5.99,
    stock: 22,
    description:
        'Lightly roasted and salted almonds, a wholesome snack packed with protein and healthy fats.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p8',
    name: 'Cherry Tomatoes (500g)',
    type: 'Vegetables',
    price: 2.99,
    stock: 0,
    description:
        'Sweet, juicy cherry tomatoes perfect for salads, pasta, or snacking straight from the box.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p9',
    name: 'Greek Yogurt (500g)',
    type: 'Dairy & Eggs',
    price: 3.49,
    stock: 27,
    description:
        'Thick and creamy Greek yogurt, strained for extra protein. Great on its own or with fruit.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p10',
    name: 'Dark Chocolate Bar (100g)',
    type: 'Snacks',
    price: 2.79,
    stock: 50,
    description:
        '70% cocoa dark chocolate bar, rich and smooth with a hint of bitterness. Ethically sourced cocoa.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p11',
    name: 'Avocados (Pack of 3)',
    type: 'Fruits',
    price: 4.99,
    stock: 12,
    description:
        'Perfectly ripening avocados, creamy and rich. Great for guacamole, toast, or salads.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
  const Product(
    id: 'p12',
    name: 'Sourdough Loaf',
    type: 'Bakery',
    price: 4.29,
    stock: 9,
    description:
        'Traditional slow-fermented sourdough with a crisp crust and airy crumb. Baked fresh daily.',
    imageUrl: 'https://picsum.photos/seed/p1/400/400',
  ),
];