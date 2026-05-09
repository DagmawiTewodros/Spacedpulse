import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CropsScreen extends StatelessWidget {
  const CropsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1B5E20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBECE3),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'Search crops...',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All Crops', isSelected: true),
                    const SizedBox(width: 8),
                    _buildFilterChip('Growing', isSelected: false),
                    const SizedBox(width: 8),
                    _buildFilterChip('Ready to Harvest', isSelected: false),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Title & Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Inventory',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1C19),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE0B2), // Light orange
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      '12 Species',
                      style: TextStyle(
                        color: Color(0xFFE65100),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Inventory List
              GestureDetector(
                onTap: () => context.push('/crop_detail_screen'),
                child: _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1592841200221-a6898f307baa?auto=format&fit=crop&q=80&w=200',
                  category: 'VEGETABLES',
                  categoryColor: const Color(0xFFB57F4D),
                  title: 'Heirloom Tomato',
                  status: 'GROWING',
                  statusColor: const Color(0xFF2E7D32),
                  hasStatusDot: true,
                  stat1Label: 'HYDRATION',
                  stat1Value: '85% Optimal',
                  stat1ValueColor: const Color(0xFF2E7D32),
                  stat2Label: 'HARVEST IN',
                  stat2Value: '12 Days',
                  stat2ValueColor: const Color(0xFF1A1C19),
                ),
              ),
              const SizedBox(height: 16),

              _buildCropCard(
                imageUrl: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?auto=format&fit=crop&q=80&w=200',
                category: 'GRAINS',
                categoryColor: const Color(0xFFB57F4D),
                title: 'Winter Wheat',
                status: 'READY',
                statusColor: const Color(0xFFFF8F00),
                hasStatusDot: false,
                stat1Label: 'YIELD EST.',
                stat1Value: '4.2 Tons/Ha',
                stat1ValueColor: const Color(0xFF2E7D32),
                stat2Label: 'QUALITY',
                stat2Value: 'Premium',
                stat2ValueColor: const Color(0xFF1A1C19),
              ),
              const SizedBox(height: 16),

              _buildCropCard(
                imageUrl: 'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?auto=format&fit=crop&q=80&w=200',
                category: 'FRUITS',
                categoryColor: Colors.grey,
                title: 'Wild Blueberries',
                status: 'DORMANT',
                statusColor: Colors.grey,
                hasStatusDot: false,
                stat1Label: 'SEASON',
                stat1Value: 'Summer',
                stat1ValueColor: const Color(0xFF1A1C19),
                stat2Label: 'NEXT CARE',
                stat2Value: 'Mar 15',
                stat2ValueColor: const Color(0xFF1A1C19),
              ),
              const SizedBox(height: 16),

              _buildCropCard(
                imageUrl: 'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=200',
                category: 'GRAINS',
                categoryColor: const Color(0xFFB57F4D),
                title: 'Sweet Corn',
                status: 'GROWING',
                statusColor: const Color(0xFF2E7D32),
                hasStatusDot: false,
                stat1Label: 'STATUS',
                stat1Value: 'Thriving',
                stat1ValueColor: const Color(0xFF2E7D32),
                stat2Label: 'HARVEST IN',
                stat2Value: '45 Days',
                stat2ValueColor: const Color(0xFF1A1C19),
              ),
              const SizedBox(height: 32),

              // Farm Health Snapshot
              const Text(
                'Farm Health Snapshot',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C19),
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.water_drop_outlined, color: Colors.white, size: 28),
                          SizedBox(height: 16),
                          Text(
                            'AVG. MOISTURE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '72%',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8F00),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 28),
                          SizedBox(height: 16),
                          Text(
                            'DAILY SUN',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '8.5h',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80), // Padding for FAB
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
                _buildNavItem(context, Icons.energy_savings_leaf, 'CROPS', true, '/crops_screen'),
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

  Widget _buildFilterChip(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1B5E20) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCropCard({
    required String imageUrl,
    required String category,
    required Color categoryColor,
    required String title,
    required String status,
    required Color statusColor,
    required bool hasStatusDot,
    required String stat1Label,
    required String stat1Value,
    required Color stat1ValueColor,
    required String stat2Label,
    required String stat2Value,
    required Color stat2ValueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: status == 'DORMANT' ? Colors.grey[200] : statusColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (hasStatusDot) ...[
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            status,
                            style: TextStyle(
                              color: status == 'DORMANT' ? Colors.grey[600] : Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1C19),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat1Label,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            stat1Value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: stat1ValueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat2Label,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            stat2Value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: stat2ValueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
