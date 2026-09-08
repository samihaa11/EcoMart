import 'package:flutter/material.dart';
import 'products.dart'; 
import 'product_detail_screen.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = sampleProducts
        .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3D1F),
        foregroundColor: Colors.white,
        title: const Text('EcoMart', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value),
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF34C759)),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredProducts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      return _ProductCard(product: filteredProducts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final bool outOfStock = product.stock == 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFFE6F4EA),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 20, height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stack) => Icon(
                        Icons.image_outlined,
                        color: const Color(0xFF34C759).withValues(alpha: 0.6),
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.type,
                style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0B3D1F)),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0B3D1F)),
                  ),
                  if (outOfStock)
                    const Text(
                      'Out of stock',
                      style: TextStyle(fontSize: 11, color: Colors.redAccent, fontWeight: FontWeight.w600),
                    )
                  else
                    IconButton(
                      onPressed: () {
                        CartService.instance.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.name} added to cart')),
                          );
                        },
                      icon: const Icon(Icons.add_circle, color: Color(0xFF34C759)),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}