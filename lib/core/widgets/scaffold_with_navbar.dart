import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavbar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: child,
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
                  context,
                  Icons.home_filled,
                  'HOME',
                  currentRoute == '/home_screen',
                  '/home_screen',
                ),
                _buildNavItem(
                  context,
                  Icons.energy_savings_leaf_outlined,
                  'CROPS',
                  currentRoute == '/statstics_dashboard_screen',
                  '/statstics_dashboard_screen',
                ),
                _buildNavItem(
                  context,
                  Icons.assignment_outlined,
                  'TASKS',
                  currentRoute == '/tasks_screen',
                  '/tasks_screen',
                ),
                _buildNavItem(
                  context,
                  Icons.wb_sunny_outlined,
                  'WEATHER',
                  currentRoute == '/weather_screen',
                  '/weather_screen',
                ),
                _buildNavItem(
                  context,
                  Icons.person_outline,
                  'PROFILE',
                  currentRoute == '/profile_screen',
                  '/profile_screen',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
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
