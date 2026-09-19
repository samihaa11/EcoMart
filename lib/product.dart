class Product{
  final int id;
  final String name;
  final String image;
  final String category;
  final String description;
  final double price;
  int quantity;

  bool get availability{
  if (quantity > 0) {
    return true;
  } 
  else{
    return false;
  }
}

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

List<Product> products = [
  Product(
    id: 2056,
    name: 'Bamboo Toothbrush',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Gyeamu7LO88fL8l80lTCLGIYurZ-8RcbSGmxxxNqvw&s=10',
    category: 'Personal Care',
    description: 'Eco-friendly toothbrush made from sustainable bamboo.',
    price: 3.99,
    quantity: 25,
  ),

  Product(
    id: 3327,
    name: 'Paper Pen',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2EcJi7NM_vTRi213wit6Qp-fyMWcckmhGWZDxAwrz2w&s=10',
    category: 'Writing',
    description: 'Black ink pen made from hard paper, easy and comfortable to write with.',
    price: 0.99,
    quantity: 47,
  ),

    Product(
    id: 4102,
    name: 'Reusable Water Bottle',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhrww0oS2tx1BPHYXRuMPAYQvLwjqI73ce8YNzjC3pZQ&s=10',
    category: 'Kitchen',
    description: 'BPA-free stainless steel bottle that keeps drinks cold for 24 hours.',
    price: 12.99,
    quantity: 30,
  ),

  Product(
    id: 4587,
    name: 'Cotton Tote Bag',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLx4y-4AMYYXo2in2-D5Gokv2M3CgTR4KGX3RFxINCyw&s=10',
    category: 'Accessories',
    description: 'Durable, washable tote bag made from 100% organic cotton.',
    price: 6.49,
    quantity: 0,
  ),

  Product(
    id: 5210,
    name: 'Beeswax Food Wrap',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMlJrvV0QjpyxpHBJI7EyIB0Xhqb3n9T18jHSg0unTRA&s=10',
    category: 'Kitchen',
    description: 'Reusable food wrap made from organic cotton and beeswax, replaces plastic wrap.',
    price: 9.99,
    quantity: 40,
  ),

  Product(
    id: 5893,
    name: 'Bamboo Cutlery Set',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIUVpsJPhbblxNbGf2y7mM8rz_T4OY4JuQ2p43_bJZXQ&s=10',
    category: 'Kitchen',
    description: 'Portable bamboo fork, knife, and spoon set with a carrying pouch.',
    price: 8.49,
    quantity: 35,
  ),

  Product(
    id: 6104,
    name: 'Recycled Notebook',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAkdQ498xWbpJFI6IQVtcZ-6I99LpCkfajUJftPtq4Ew&s=10',
    category: 'Writing',
    description: 'A5 notebook made from 100% recycled paper, 120 lined pages.',
    price: 4.99,
    quantity: 50,
  ),

  Product(
    id: 6455,
    name: 'Solar Power Bank',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRha6Ze54XegYAlMGCCIzDuoPXB9WZahLMSZtJRPMZWEQ&s=10',
    category: 'Electronics',
    description: '10000mAh power bank with solar charging panel for outdoor use.',
    price: 24.99,
    quantity: 0,
  ),

  Product(
    id: 6788,
    name: 'Organic Cotton T-Shirt',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx6wGDhAUJVWYCgnqvJHeepf0wmIOEI7WjP6-xK9pghw&s=10',
    category: 'Clothing',
    description: 'Soft, breathable t-shirt made from 100% organic cotton.',
    price: 14.99,
    quantity: 45,
  ),

  Product(
    id: 7021,
    name: 'Loofah Sponge',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-CD1VbQUp5I4g_Af3ozCmDtNbN-1QyYVxTgWAX_omog&s=10',
    category: 'Personal Care',
    description: 'Natural plant-based sponge, biodegradable and compostable.',
    price: 2.99,
    quantity: 0,
  ),

  Product(
    id: 7364,
    name: 'Wooden Hair Brush',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpWt06AZy8SYm3qoOVI9aHEQnZSaom3sW0p4NwZ4AK1A&s=10',
    category: 'Personal Care',
    description: 'Handle made from sustainably sourced beechwood with natural boar bristles.',
    price: 7.99,
    quantity: 28,
  ),

  Product(
    id: 7699,
    name: 'Glass Storage Jars',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRzK5snWsB3fUCUOGS3XzrdzALVxBF2spcAFPPrVBO3w&s=10',
    category: 'Kitchen',
    description: 'Airtight glass jars with bamboo lids, ideal for pantry storage.',
    price: 15.99,
    quantity: 22,
  ),

  Product(
    id: 8012,
    name: 'Compostable Trash Bags',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjlj5-kAF_EfE7V92kCBsSXgoSyB_aqFxQsl0Ol-UDgA&s=10',
    category: 'Household',
    description: 'Plant-based trash bags that fully decompose within 180 days.',
    price: 5.99,
    quantity: 55,
  ),

  Product(
    id: 8345,
    name: 'Bamboo Cutting Board',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjNR_C0iCs5CT8ia3m_9yH5zwJ_Bg38UdNcJ6yLyswQg&s=10',
    category: 'Kitchen',
    description: 'Durable bamboo cutting board, gentle on knife blades.',
    price: 11.49,
    quantity: 33,
  ),

  Product(
    id: 8678,
    name: 'Reusable Coffee Cup',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6ra3iKl4kfJ5jEJ-j5SBwX9IFIJqZ2ELVXEQq02ekg&s=10',
    category: 'Kitchen',
    description: 'Insulated coffee cup made from recycled materials with a spill-proof lid.',
    price: 10.99,
    quantity: 0,
  ),

  Product(
    id: 9001,
    name: 'Natural Soap Bar',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAj4kniB6nPDPoJBUK0NuqjPujI-EgDgV0Ka7kumVCsg&s=10',
    category: 'Personal Care',
    description: 'Handmade soap bar with essential oils, free from synthetic fragrances.',
    price: 3.49,
    quantity: 65,
  ),

  Product(
    id: 9334,
    name: 'Hemp Backpack',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz_w1cV7hVgHtKss2KX_pvD6naEEaNl8e6U2ZEFTg4MA&s=10',
    category: 'Accessories',
    description: 'Durable backpack woven from hemp fiber, water-resistant coating.',
    price: 29.99,
    quantity: 15,
  ),

  Product(
    id: 9667,
    name: 'Si Food Storage Bags',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ2bu9HcPXjUj_w73UizbuOSX5f96u0misEiWChenH-Q&s=10',
    category: 'Kitchen',
    description: 'Reusable, leak-proof silicone bags for storing food, dishwasher safe.',
    price: 13.99,
    quantity: 26,
  ),

  Product(
    id: 9990,
    name: 'Recycled Pencil Set',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrocUZsfEfHMzVpurA_pSYjWmNUOtiT_HJpXgrT7-_AQ&s',
    category: 'Writing',
    description: 'Set of 5 pencils made from recycled newspaper instead of wood.',
    price: 3.99,
    quantity: 58,
  ),

  Product(
    id: 10123,
    name: 'Wool Dryer Balls',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBpx-qS4CV7soT_qICnyXCZtTg3m-ZUXFrzoOQjd9VA&s=10',
    category: 'Household',
    description: 'Reusable wool balls that replace dryer sheets and reduce drying time.',
    price: 8.99,
    quantity: 42,
  ),

];