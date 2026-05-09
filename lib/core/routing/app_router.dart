import 'package:go_router/go_router.dart';
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

    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/home_screen',
      builder: (context, state) => const HomeScreen(),
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
      builder: (context, state) => const ProfilePage(),
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
      builder: (context, state) => const DashboardPage(),
    ),

    GoRoute(
      path: '/weather_screen',
      builder: (context, state) => const WeatherScreen(),
    ),

    GoRoute(
      path: '/tasks_screen',
      builder: (context, state) => const DailyTasksPage(),
    ),
    GoRoute(
      path: '/calendar_screen',
      builder: (context, state) => const FarmKeeperPage(),
    ),
  ],
);
