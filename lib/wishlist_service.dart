import 'package:flutter/foundation.dart';
import 'products.dart';

/// Singleton wishlist service — mirrors the pattern used by CartService.
class WishlistService extends ChangeNotifier {
  WishlistService._internal();
  static final WishlistService instance = WishlistService._internal();

  final Set<String> _wishlistedIds = {};

  bool isWishlisted(String productId) => _wishlistedIds.contains(productId);

  int get count => _wishlistedIds.length;

  List<Product> getWishlistedProducts() {
    return sampleProducts
        .where((p) => _wishlistedIds.contains(p.id))
        .toList();
  }

  void toggle(String productId) {
    if (_wishlistedIds.contains(productId)) {
      _wishlistedIds.remove(productId);
    } else {
      _wishlistedIds.add(productId);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _wishlistedIds.remove(productId);
    notifyListeners();
  }
}
