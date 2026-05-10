import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'image': 'assets/images/splash1.png',
      'icon': Icons.local_florist,
      'title': 'Track Your ',
      'highlight': 'Crops',
      'subtitle': ' Easily',
      'description':
          'Manage your entire crop lifecycle from initial planting to the final harvest with precision tools designed for the modern grower.',
    },
    {
      'image': 'assets/images/splash2.png',
      'icon': Icons.water_drop,
      'title': 'Smart ',
      'highlight': 'Irrigation',
      'subtitle': '',
      'description':
          'Monitor soil moisture and automate watering schedules to ensure optimal growth conditions for your crops.',
    },
    {
      'image': 'assets/images/splash3.png',
      'icon': Icons.insights,
      'title': 'Data ',
      'highlight': 'Analytics',
      'subtitle': '',
      'description':
          'Get real-time insights and reports on your farm performance to make informed decisions.',
    },
  ];

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      context.go('/create_account_screen');
    }
  }

  void skip() {
    context.go('/create_account_screen');
  }

  @override
  Widget build(BuildContext context) {
    final data = onboardingData[currentPage];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      data['image'] as String,
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.image,
                            size: 60,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2E7D32),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Icon(
                        data['icon'] as IconData,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: data['title'] as String),
                    TextSpan(
                      text: data['highlight'] as String,
                      style: const TextStyle(color: Color(0xFF2E7D32)),
                    ),
                    TextSpan(text: data['subtitle'] as String),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data['description'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5A5A5A),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? const Color(0xFF2E7D32)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentPage == onboardingData.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: skip,
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
