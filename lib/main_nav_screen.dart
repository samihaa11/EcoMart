import 'package:flutter/material.dart';
import 'filter_sort_home.dart';
import 'wishlist_screen.dart';
import 'wishlist_service.dart';
import 'cart.dart';
import 'cart_screen.dart';

class NavPage {
  final String label;
  final IconData icon;
  final Widget screen;

  const NavPage({required this.label, required this.icon, required this.screen});
}

final List<NavPage> navPages = [
  const NavPage(label: 'Home', icon: Icons.home_rounded, screen: FilterSortHomePage()),
  const NavPage(label: 'Wishlist', icon: Icons.favorite_rounded, screen: WishlistScreen()),
  const NavPage(label: 'Cart', icon: Icons.shopping_bag_rounded, screen: CartScreen()),
];

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: navPages.map((page) => page.screen).toList(),
      ),
      bottomNavigationBar: _BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([CartService.instance, WishlistService.instance]),
      builder: (context, _) {
        final cartCount = CartService.instance.itemCount;
        final wishlistCount = WishlistService.instance.count;

        return SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(navPages.length, (index) {
                final page = navPages[index];
                final badgeCount = page.label == 'Cart'
                    ? cartCount
                    : page.label == 'Wishlist'
                        ? wishlistCount
                        : 0;

                return _NavItem(
                  icon: page.icon,
                  label: page.label,
                  isActive: currentIndex == index,
                  onTap: () => onTap(index),
                  badgeCount: badgeCount,
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF0B3D1F);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isActive ? activeColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 22, color: isActive ? Colors.white : Colors.grey.shade400),
              ),
              if (badgeCount > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                    child: Text(
                      '$badgeCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? activeColor : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}