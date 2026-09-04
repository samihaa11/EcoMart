import 'package:flutter/foundation.dart';
import 'products.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get total => product.price * quantity;
}

class CartService extends ChangeNotifier {
  CartService._internal();
  static final CartService instance = CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _items.fold(0.0, (sum, item) => sum + item.total);

  double get shipping => _items.isEmpty ? 0.0 : 4.99;

  double get total => subtotal + shipping;

  void addToCart(Product product) {
    final index = _items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      if (_items[index].quantity < product.stock) {
        _items[index].quantity++;
      }
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void increment(String productId) {
    final index = _items.indexWhere((i) => i.product.id == productId);
    if (index >= 0 && _items[index].quantity < _items[index].product.stock) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrement(String productId) {
    final index = _items.indexWhere((i) => i.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(String productId) {
    _items.removeWhere((i) => i.product.id == productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}