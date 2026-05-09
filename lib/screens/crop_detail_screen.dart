import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CropDetailScreen extends StatelessWidget {
  const CropDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1592841200221-a6898f307baa?q=80&w=800&auto=format&fit=crop',
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 240,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.image, size: 50)),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.energy_savings_leaf, color: Color(0xFF2E7D32), size: 16),
                            SizedBox(width: 8),
                            Text(
                              'Heirloom Tomato',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1C19),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Maturity & Harvest Cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  value: 0.65,
                                  strokeWidth: 6,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                                ),
                              ),
                              const Text(
                                '65%',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1C19),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'MATURITY',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB57F4D),
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8F00),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.timer_outlined, color: Colors.white, size: 28),
                          const SizedBox(height: 16),
                          const Text(
                            '22',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'DAYS TO HARVEST',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Planting Date Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA5D6A7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.calendar_today, color: Color(0xFF1B5E20), size: 24),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PLANTING DATE',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFFB57F4D), letterSpacing: 1.0),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'March 14, 2024',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1A1C19)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'FIELD',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Zone B-4',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1A1C19)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Watering Schedule Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Watering Schedule',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1C19)),
                        ),
                        Icon(Icons.water_drop, color: Color(0xFF1B5E20)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDayWidget('MON', status: 'checked'),
                        _buildDayWidget('TUE', status: 'active'),
                        _buildDayWidget('WED', status: 'checked'),
                        _buildDayWidget('THU', status: 'pending'),
                        _buildDayWidget('FRI', status: 'empty'),
                        _buildDayWidget('SAT', status: 'empty'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.info_outline, color: Color(0xFFB57F4D), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Next irrigation cycle starts in ',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text(
                          '4 hours.',
                          style: TextStyle(color: Color(0xFF1A1C19), fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Maintenance Notes
              const Text(
                'Maintenance Notes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1C19)),
              ),
              const SizedBox(height: 16),

              _buildNoteCard(
                title: 'Soil Check',
                time: '2H AGO',
                description: 'PH levels slightly elevated in the North-East quadrant. Adjusted nutrient mix for the morning cycle.',
              ),
              const SizedBox(height: 12),
              _buildNoteCard(
                title: 'Pest Control',
                time: 'YESTERDAY',
                description: 'Applied organic neem oil spray. Aphid population has significantly decreased.',
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF81C784),
                    foregroundColor: const Color(0xFF1A1C19),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Add New Note',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(context, Icons.home_filled, 'HOME', false, '/home_screen'),
                _buildNavItem(context, Icons.energy_savings_leaf_outlined, 'CROPS', true, null),
                _buildNavItem(context, Icons.assignment_outlined, 'TASKS', false, null),
                _buildNavItem(context, Icons.wb_sunny_outlined, 'WEATHER', false, null),
                _buildNavItem(context, Icons.person_outline, 'PROFILE', false, '/profile_screen'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDayWidget(String day, {required String status}) {
    Color textColor = Colors.grey;
    if (status == 'active' || status == 'pending') {
      textColor = const Color(0xFF2E7D32);
    }
    
    Widget iconContent;
    BoxDecoration decoration;

    switch (status) {
      case 'checked':
        iconContent = const Icon(Icons.check, color: Colors.grey, size: 14);
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        );
        break;
      case 'active':
        iconContent = const Icon(Icons.water_drop, color: Colors.white, size: 14);
        decoration = BoxDecoration(
          color: const Color(0xFF2E7D32),
          shape: BoxShape.circle,
        );
        break;
      case 'pending':
        iconContent = const Icon(Icons.access_time, color: Color(0xFF2E7D32), size: 14);
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF2E7D32), width: 1.5),
        );
        break;
      case 'empty':
      default:
        iconContent = const SizedBox(width: 14, height: 14);
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        );
        break;
    }

    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 32,
          height: 32,
          decoration: decoration,
          child: Center(child: iconContent),
        ),
      ],
    );
  }

  Widget _buildNoteCard({
    required String title,
    required String time,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C19),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF4A4C49),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    String? route,
  ) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          context.push(route);
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
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFF2E7D32) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
