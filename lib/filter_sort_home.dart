import 'package:flutter/material.dart';
import 'products.dart';
import 'product_detail_screen.dart';
import 'cart.dart';
import 'wishlist_service.dart';

// ---------------------------------------------------------
// Filter tags — eco-labels mapped to product types/keywords
// ---------------------------------------------------------
enum EcoFilter { plasticFree, organic, recyclable, vegan }

extension EcoFilterExt on EcoFilter {
  String get label {
    switch (this) {
      case EcoFilter.plasticFree: return 'Plastic-free';
      case EcoFilter.organic:     return 'Organic';
      case EcoFilter.recyclable:  return 'Recyclable';
      case EcoFilter.vegan:       return 'Vegan';
    }
  }

  IconData get icon {
    switch (this) {
      case EcoFilter.plasticFree: return Icons.block_rounded;
      case EcoFilter.organic:     return Icons.eco_rounded;
      case EcoFilter.recyclable:  return Icons.recycling_rounded;
      case EcoFilter.vegan:       return Icons.spa_rounded;
    }
  }

  /// Returns true if the product matches this eco filter.
  bool matches(Product p) {
    final name = p.name.toLowerCase();
    final type = p.type.toLowerCase();
    switch (this) {
      case EcoFilter.plasticFree:
        // Bamboo, metal, paper, earthen, fibre, jute products are plastic-free
        return name.contains('bamboo') ||
            name.contains('metal') ||
            name.contains('paper') ||
            name.contains('earthen') ||
            name.contains('fibre') ||
            type == 'utensils' ||
            type == 'writing' ||
            type == 'furniture';
      case EcoFilter.organic:
        return name.contains('organic') ||
            type == 'vegetables' ||
            type == 'bakery' ||
            type == 'beverages';
      case EcoFilter.recyclable:
        return type == 'storage' ||
            name.contains('bamboo') ||
            name.contains('metal') ||
            name.contains('paper') ||
            name.contains('fibre');
      case EcoFilter.vegan:
        return type == 'vegetables' ||
            type == 'bakery' ||
            type == 'beverages' ||
            type == 'storage' ||
            type == 'utensils' ||
            type == 'writing' ||
            type == 'furniture' ||
            type == 'bottle' ||
            type == 'brush';
    }
  }
}

// ---------------------------------------------------------
// Sort options
// ---------------------------------------------------------
enum SortOption { none, priceLow, priceHigh, popularity, newest }

extension SortOptionExt on SortOption {
  String get label {
    switch (this) {
      case SortOption.none:        return 'Default';
      case SortOption.priceLow:    return 'Price: Low to High';
      case SortOption.priceHigh:   return 'Price: High to Low';
      case SortOption.popularity:  return 'Popularity';
      case SortOption.newest:      return 'Newest';
    }
  }
}

// ---------------------------------------------------------
// Enhanced Home Page
// ---------------------------------------------------------
class FilterSortHomePage extends StatefulWidget {
  const FilterSortHomePage({super.key});

  @override
  State<FilterSortHomePage> createState() => _FilterSortHomePageState();
}

class _FilterSortHomePageState extends State<FilterSortHomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  final Set<EcoFilter> _activeFilters = {};
  SortOption _sortOption = SortOption.none;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _displayedProducts {
    List<Product> list = List.of(sampleProducts);

    // Search filter
    if (_query.isNotEmpty) {
      list = list.where((p) => p.name.toLowerCase().contains(_query.toLowerCase())).toList();
    }

    // Eco filters (AND logic — product must match ALL selected filters)
    for (final filter in _activeFilters) {
      list = list.where((p) => filter.matches(p)).toList();
    }

    // Sort
    switch (_sortOption) {
      case SortOption.priceLow:
        list.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceHigh:
        list.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.popularity:
        // Use stock as a proxy: lower stock = more popular (sold more)
        list.sort((a, b) => a.stock.compareTo(b.stock));
        break;
      case SortOption.newest:
        // Reverse the original list order (last added = newest)
        list = list.reversed.toList();
        break;
      case SortOption.none:
        break;
    }

    return list;
  }

  void _showSortSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sort Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0B3D1F)),
            ),
            const SizedBox(height: 12),
            ...SortOption.values.map((opt) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio<SortOption>(
                value: opt,
                groupValue: _sortOption,
                activeColor: const Color(0xFF34C759),
                onChanged: (v) {
                  setState(() => _sortOption = v!);
                  Navigator.pop(context);
                },
              ),
              title: Text(opt.label, style: const TextStyle(fontSize: 15)),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = _displayedProducts;
    final hasActiveFilter = _activeFilters.isNotEmpty || _sortOption != SortOption.none;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3D1F),
        foregroundColor: Colors.white,
        title: const Text('EcoMart', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          // Sort button
          IconButton(
            tooltip: 'Sort',
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.sort_rounded),
                if (_sortOption != SortOption.none)
                  Positioned(
                    right: -2, top: -2,
                    child: Container(
                      width: 8, height: 8,
                      decoration: const BoxDecoration(color: Color(0xFF34C759), shape: BoxShape.circle),
                    ),
                  ),
              ],
            ),
            onPressed: _showSortSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // -- Search bar --
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3)),
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

          // -- Filter chips --
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: EcoFilter.values.map((filter) {
                final active = _activeFilters.contains(filter);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    avatar: Icon(filter.icon, size: 15, color: active ? Colors.white : const Color(0xFF0B3D1F)),
                    label: Text(filter.label),
                    selected: active,
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          _activeFilters.add(filter);
                        } else {
                          _activeFilters.remove(filter);
                        }
                      });
                    },
                    selectedColor: const Color(0xFF0B3D1F),
                    backgroundColor: Colors.white,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: active ? Colors.white : const Color(0xFF0B3D1F),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: active ? const Color(0xFF0B3D1F) : Colors.grey.shade300,
                      ),
                    ),
                    showCheckmark: false,
                    elevation: 0,
                    pressElevation: 0,
                  ),
                );
              }).toList(),
            ),
          ),

          // -- Active filters summary row --
          if (hasActiveFilter)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Row(
                children: [
                  Text(
                    '${products.length} result${products.length == 1 ? "" : "s"}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() {
                      _activeFilters.clear();
                      _sortOption = SortOption.none;
                    }),
                    child: const Text(
                      'Clear all',
                      style: TextStyle(fontSize: 12, color: Color(0xFF34C759), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

          // -- Product grid --
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.70,
                    ),
                    itemBuilder: (context, index) {
                      return _EcoProductCard(product: products[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// Product card with wishlist heart button
// ---------------------------------------------------------
class _EcoProductCard extends StatelessWidget {
  final Product product;
  const _EcoProductCard({required this.product});

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
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
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
                    // Wishlist heart button
                    Positioned(
                      top: 4,
                      right: 4,
                      child: AnimatedBuilder(
                        animation: WishlistService.instance,
                        builder: (context, _) {
                          final wishlisted = WishlistService.instance.isWishlisted(product.id);
                          return GestureDetector(
                            onTap: () {
                              WishlistService.instance.toggle(product.id);
                              final msg = wishlisted
                                  ? '${product.name} removed from wishlist'
                                  : '${product.name} added to wishlist';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(msg), duration: const Duration(seconds: 1)),
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 4),
                                ],
                              ),
                              child: Icon(
                                wishlisted ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                color: wishlisted ? Colors.redAccent : Colors.grey.shade400,
                                size: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(product.type, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
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
