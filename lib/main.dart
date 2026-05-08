import 'package:go_router/go_router.dart';
import '../../screens/splash_screen.dart';
import '../../screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home_screen',

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/home_screen',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);