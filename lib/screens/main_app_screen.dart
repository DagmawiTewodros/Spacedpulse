import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/bottom_navbar.dart';
import '../../screens/home_screen.dart';
import '../../screens/statstics_dashboard_screen.dart';
import '../../screens/tasks_screen.dart';
import '../../screens/weather_screen.dart';
import '../../screens/profile_screen.dart';

class MainAppScreen extends StatefulWidget {
  final int initialIndex;

  const MainAppScreen({super.key, this.initialIndex = 0});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> with TickerProviderStateMixin {
  late int _selectedIndex;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Pre-loaded screens to avoid rebuilding
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    
    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    // Initialize fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Initialize screens
    _screens.addAll([
      const HomeScreen(),
      const DashboardPage(),
      const DailyTasksPage(),
      const WeatherScreen(),
      const ProfilePage(),
    ]);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavbar(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      floatingActionButton: _selectedIndex == 2 ? FloatingActionButton(
        backgroundColor: const Color(0xFF2E7D32),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ) : null,
      appBar: _selectedIndex == 4 ? AppBar(
        backgroundColor: const Color(0xFFF4F7F1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {
              // Navigates to the settings screen
              context.go('/settings_screen');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Navigates to the notifications screen
              context.go('/notifications_screen');
            },
          ),
        ],
      ) : null,
      onNavItemTapped: _onItemTapped,
      currentIndex: _selectedIndex,
    );
  }
}