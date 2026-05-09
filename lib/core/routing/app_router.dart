import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/scaffold_with_navbar.dart';
import '../../screens/splash_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/onboarding_screen.dart';
import '../../screens/notifications_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/create_account_screen.dart';
import '../../screens/onboarding2_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/reminder_screen.dart';
import '../../screens/statstics_dashboard_screen.dart';
import '../../screens/weather_screen.dart';
import '../../screens/tasks_screen.dart';
import '../../screens/calendar_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/create_account_screen',

  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const ScaffoldWithNavbar(child: HomeScreen()),
    ),

    GoRoute(
      path: '/onboarding_screen',
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: '/notifications_screen',
      builder: (context, state) => const NotificationsPage(),
    ),

    GoRoute(
      path: '/profile_screen',
      builder: (context, state) => ScaffoldWithNavbar(
        child: const ProfilePage(),
        appBar: AppBar(
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
                GoRouter.of(context).push('/settings_screen');
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {
                GoRouter.of(context).push('/notifications_screen');
              },
            ),
          ],
        ),
      ),
    ),

    GoRoute(
      path: '/settings_screen',
      builder: (context, state) => const SettingsPage(),
    ),

    GoRoute(
      path: '/create_account_screen',
      builder: (context, state) => const CreateAccountScreen(),
    ),

    GoRoute(
      path: '/onboarding2_screen',
      builder: (context, state) => const OnboardingAnalyticsScreen(),
    ),
    GoRoute(
      path: '/login_screen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/reminder_screen',
      builder: (context, state) => const WateringReminderScreen(),
    ),
    GoRoute(
      path: '/statstics_dashboard_screen',
      builder: (context, state) => const ScaffoldWithNavbar(child: DashboardPage()),
    ),

    GoRoute(
      path: '/weather_screen',
      builder: (context, state) => const ScaffoldWithNavbar(child: WeatherScreen()),
    ),

    GoRoute(
      path: '/tasks_screen',
      builder: (context, state) => ScaffoldWithNavbar(
        child: const DailyTasksPage(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF2E7D32),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    ),
    GoRoute(
      path: '/calendar_screen',
      builder: (context, state) => const FarmKeeperPage(),
    ),
  ],
);
