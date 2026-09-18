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
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Personal Care',
    description: 'Eco-friendly toothbrush made from sustainable bamboo.',
    price: 3.99,
    quantity: 25,
  ),

  Product(
    id: 3327,
    name: 'Paper Pen',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Writing',
    description: 'Black ink pen made from hard paper, easy and comfortable to write with.',
    price: 0.99,
    quantity: 47,
  ),

    Product(
    id: 4102,
    name: 'Reusable Water Bottle',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'BPA-free stainless steel bottle that keeps drinks cold for 24 hours.',
    price: 12.99,
    quantity: 30,
  ),

  Product(
    id: 4587,
    name: 'Cotton Tote Bag',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Accessories',
    description: 'Durable, washable tote bag made from 100% organic cotton.',
    price: 6.49,
    quantity: 60,
  ),

  Product(
    id: 5210,
    name: 'Beeswax Food Wrap',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Reusable food wrap made from organic cotton and beeswax, replaces plastic wrap.',
    price: 9.99,
    quantity: 40,
  ),

  Product(
    id: 5893,
    name: 'Bamboo Cutlery Set',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Portable bamboo fork, knife, and spoon set with a carrying pouch.',
    price: 8.49,
    quantity: 35,
  ),

  Product(
    id: 6104,
    name: 'Recycled Notebook',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Writing',
    description: 'A5 notebook made from 100% recycled paper, 120 lined pages.',
    price: 4.99,
    quantity: 50,
  ),

  Product(
    id: 6455,
    name: 'Solar Power Bank',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Electronics',
    description: '10000mAh power bank with solar charging panel for outdoor use.',
    price: 24.99,
    quantity: 20,
  ),

  Product(
    id: 6788,
    name: 'Organic Cotton T-Shirt',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Clothing',
    description: 'Soft, breathable t-shirt made from 100% organic cotton.',
    price: 14.99,
    quantity: 45,
  ),

  Product(
    id: 7021,
    name: 'Loofah Sponge',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Personal Care',
    description: 'Natural plant-based sponge, biodegradable and compostable.',
    price: 2.99,
    quantity: 70,
  ),

  Product(
    id: 7364,
    name: 'Wooden Hair Brush',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Personal Care',
    description: 'Handle made from sustainably sourced beechwood with natural boar bristles.',
    price: 7.99,
    quantity: 28,
  ),

  Product(
    id: 7699,
    name: 'Glass Storage Jars (Set of 3)',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Airtight glass jars with bamboo lids, ideal for pantry storage.',
    price: 15.99,
    quantity: 22,
  ),

  Product(
    id: 8012,
    name: 'Compostable Trash Bags',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Household',
    description: 'Plant-based trash bags that fully decompose within 180 days.',
    price: 5.99,
    quantity: 55,
  ),

  Product(
    id: 8345,
    name: 'Bamboo Cutting Board',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Durable bamboo cutting board, gentle on knife blades.',
    price: 11.49,
    quantity: 33,
  ),

  Product(
    id: 8678,
    name: 'Reusable Coffee Cup',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Insulated coffee cup made from recycled materials with a spill-proof lid.',
    price: 10.99,
    quantity: 38,
  ),

  Product(
    id: 9001,
    name: 'Natural Soap Bar',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Personal Care',
    description: 'Handmade soap bar with essential oils, free from synthetic fragrances.',
    price: 3.49,
    quantity: 65,
  ),

  Product(
    id: 9334,
    name: 'Hemp Backpack',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Accessories',
    description: 'Durable backpack woven from hemp fiber, water-resistant coating.',
    price: 29.99,
    quantity: 15,
  ),

  Product(
    id: 9667,
    name: 'Silicone Food Storage Bags',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Kitchen',
    description: 'Reusable, leak-proof silicone bags for storing food, dishwasher safe.',
    price: 13.99,
    quantity: 26,
  ),

  Product(
    id: 9990,
    name: 'Recycled Pencil Set',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Writing',
    description: 'Set of 5 pencils made from recycled newspaper instead of wood.',
    price: 3.99,
    quantity: 58,
  ),

  Product(
    id: 10123,
    name: 'Wool Dryer Balls (Set of 3)',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3813hurtLzfiwBs69V6zr29yZ6p-fFIBLOGpicr-tIw&s=10',
    category: 'Household',
    description: 'Reusable wool balls that replace dryer sheets and reduce drying time.',
    price: 8.99,
    quantity: 42,
  ),

];