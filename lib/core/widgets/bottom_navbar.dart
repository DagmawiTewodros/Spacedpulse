import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Function(int)? onNavItemTapped;
  final int currentIndex;

  const BottomNavbar({
    super.key,
    required this.child,
    this.floatingActionButton,
    this.appBar,
    this.onNavItemTapped,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: child,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  Icons.home_filled,
                  'HOME',
                  currentIndex == 0,
                  0,
                ),
                _buildNavItem(
                  Icons.energy_savings_leaf_outlined,
                  'CROPS',
                  currentIndex == 1,
                  1,
                ),
                _buildNavItem(
                  Icons.assignment_outlined,
                  'TASKS',
                  currentIndex == 2,
                  2,
                ),
                _buildNavItem(
                  Icons.wb_sunny_outlined,
                  'WEATHER',
                  currentIndex == 3,
                  3,
                ),
                _buildNavItem(
                  Icons.person_outline,
                  'PROFILE',
                  currentIndex == 4,
                  4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () => onNavItemTapped?.call(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFE8F5E9) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isSelected ? const Color(0xFF2E7D32) : Colors.grey,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFF2E7D32) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
