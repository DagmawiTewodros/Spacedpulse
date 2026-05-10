import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(child: Text('Welcome to FarmKeeper')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/crops/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CropListScreen extends StatelessWidget {
  const CropListScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Crops')));
}

class AddEditCropScreen extends StatelessWidget {
  const AddEditCropScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Add/Edit Crop')));
}

class CropDetailScreen extends StatelessWidget {
  final String? id;
  const CropDetailScreen({super.key, this.id});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Crop Details: $id')));
}

class WateringRemindersScreen extends StatelessWidget {
  const WateringRemindersScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Watering Reminders')));
}

class HarvestTrackingScreen extends StatelessWidget {
  const HarvestTrackingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Harvest Tracking')));
}

class CropJournalScreen extends StatelessWidget {
  const CropJournalScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Crop Journal')));
}

class CalendarViewScreen extends StatelessWidget {
  const CalendarViewScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Calendar')));
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Settings')));
}

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/crops',
      builder: (context, state) => const CropListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddEditCropScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => CropDetailScreen(id: state.pathParameters['id']),
        ),
      ],
    ),
    GoRoute(
      path: '/watering',
      builder: (context, state) => const WateringRemindersScreen(),
    ),
    GoRoute(
      path: '/harvest',
      builder: (context, state) => const HarvestTrackingScreen(),
    ),
    GoRoute(
      path: '/journal',
      builder: (context, state) => const CropJournalScreen(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarViewScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.path}'),
    ),
  ),
);