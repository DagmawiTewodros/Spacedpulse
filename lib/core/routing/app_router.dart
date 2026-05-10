import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_navbar.dart';
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
import '../../screens/main_app_screen.dart';

import '../../screens/add_crop.dart';
import '../../screens/crop_journal_page.dart';
import '../../screens/harvest_page.dart';
import '../../screens/watering_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash_screen',

  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/main_app',
      builder: (context, state) => const MainAppScreen(initialIndex: 0),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const MainAppScreen(initialIndex: 0),
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
      builder: (context, state) => const MainAppScreen(initialIndex: 4),
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
      builder: (context, state) => const MainAppScreen(initialIndex: 1),
    ),

    GoRoute(
      path: '/weather_screen',
      builder: (context, state) => const MainAppScreen(initialIndex: 3),
    ),

    GoRoute(
      path: '/tasks_screen',
      builder: (context, state) => const MainAppScreen(initialIndex: 2),
    ),

    GoRoute(
      path: '/calendar_screen',
      builder: (context, state) => const FarmKeeperPage(),
    ),

    GoRoute(
      path: '/add_crop',
      builder: (context, state) => const AddCropPage(),
    ),

    GoRoute(
      path: '/crop_journal_page',
      builder: (context, state) => const CropJournalPage(),
    ),

    GoRoute(
      path: '/harvest_page',
      builder: (context, state) => const HarvestPage(),
    ),

    GoRoute(
      path: '/watering_page',
      builder: (context, state) => const WateringPage(),
    ),
  ],
);
