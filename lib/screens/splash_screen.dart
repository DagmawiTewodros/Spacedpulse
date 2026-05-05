import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F5E9), // Light green-ish
              Color(0xFFF1F8E9), // Very light yellow-green
              Color(0xFFF9FBE7), // Cream
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              // Main circular image
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Logo icon
              Transform.scale(
                scaleX: -1,
                child: const Icon(
                  Icons.psychology,
                  size: 70,
                  color: Color(0xFF1B5E20), // Dark green
                ),
              ),
              
              const SizedBox(height: 10),
              
              // App Name
              const Text(
                'FarmKeeper',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C1C),
                  letterSpacing: -1.0,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Tagline
              const Text(
                'Precision technology for the\nmodern harvest.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5A5A5A),
                  height: 1.5,
                ),
              ),
              
              const Spacer(flex: 3),
              
              // Custom Progress Bar
              Container(
                width: 150,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50, // Partially filled
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E7D32),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Status text
              const Text(
                'INITIALIZING FIELD SENSORS',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: Color(0xFF757575),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Three dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(const Color(0xFF81C784)), // Active dot
                  const SizedBox(width: 6),
                  _buildDot(Colors.grey[400]!),
                  const SizedBox(width: 6),
                  _buildDot(Colors.grey[400]!),
                ],
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
