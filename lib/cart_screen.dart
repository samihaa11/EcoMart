import 'package:flutter/material.dart';
import 'cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  void _checkout() {
    final cart = CartService.instance;
    if (cart.items.isEmpty) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Order placed!'),
        content: Text(
          'Your order totaling \$${cart.total.toStringAsFixed(2)} has been placed successfully.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              cart.clear();
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3D1F),
        foregroundColor: Colors.white,
        title: const Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: CartService.instance,
        builder: (context, _) {
          final cart = CartService.instance;

          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  Text('Your cart is empty', style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return _CartItemTile(item: item);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, -3)),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F7F5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                controller: _promoController,
                                decoration: const InputDecoration(
                                  hintText: 'Promo Code',
                                  prefixIcon: Icon(Icons.local_offer_outlined, size: 20),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Promo codes coming soon')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0B3D1F),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                            ),
                            child: const Text('Apply'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _SummaryRow(label: 'Subtotal', value: cart.subtotal),
                      const SizedBox(height: 6),
                      _SummaryRow(label: 'Shipping', value: cart.shipping),
                      const Divider(height: 22),
                      _SummaryRow(label: 'Total', value: cart.total, isBold: true),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _checkout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF34C759),
                            foregroundColor: const Color(0xFF0B3D1F),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: 0,
                          ),
                          child: const Text('Checkout', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isBold;
  const _SummaryRow({required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: isBold ? 16 : 14,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
      color: const Color(0xFF0B3D1F),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text('\$${value.toStringAsFixed(2)}', style: style),
      ],
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartItem item;
  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Center(
                  child: Icon(Icons.image_outlined, color: const Color(0xFF34C759).withValues(alpha: 0.6), size: 28),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0B3D1F)),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => CartService.instance.decrement(item.product.id),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: item.quantity < item.product.stock
                          ? () => CartService.instance.increment(item.product.id)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => CartService.instance.removeFromCart(item.product.id),
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _QtyButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFFE6F4EA) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: enabled ? const Color(0xFF0B3D1F) : Colors.grey),
      ),
    );
  }
}