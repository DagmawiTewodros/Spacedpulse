import 'package:flutter/material.dart';

class WateringPage extends StatelessWidget {
  const WateringPage({super.key});

  // Custom Colors to match the image
  static const Color bgColor = Color(0xffF9FAF5);
  static const Color darkGreen = Color(0xff2A6F2B);
  static const Color accentBrown = Color(0xffA67C52);
  static const Color cardGrey = Color(0xffEDF1E6);
  static const Color textGrey = Color(0xff7A8677);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _buildCropFocusCard(),
            const SizedBox(height: 24),
            _buildIntervalsSection(),
            const SizedBox(height: 24),
            _buildHydrationHealthCard(),
            const SizedBox(height: 24),
            _buildRecentHistorySection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=150&h=150&auto=format&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      title: const Text(
        "Organic Architect",
        style: TextStyle(
          color: darkGreen,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined, color: darkGreen),
        ),
      ],
    );
  }

  Widget _buildCropFocusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CROP FOCUS",
            style: TextStyle(
              color: accentBrown,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Heritage\nTomatoes",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Management of precision hydration for Plot A-12. The soil moisture levels are currently at 42%.",
            style: TextStyle(color: textGrey, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGreen,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.opacity, color: Colors.white),
            label: const Text(
              "Mark as Watered",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: accentBrown,
                ),
                SizedBox(width: 8),
                Text(
                  "NEXT: AUG 24, 08:00 AM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntervalsSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.access_time, color: darkGreen),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Watering\nIntervals",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
              Text(
                "EDITING\nENABLED",
                style: TextStyle(
                  color: accentBrown,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _intervalTile("1", "EVERY DAY", true),
          const SizedBox(height: 12),
          _intervalTile("2", "EVERY 2 DAYS", false),
          const SizedBox(height: 12),
          _intervalTile("3", "EVERY 3 DAYS", false),
          const SizedBox(height: 20),
          _buildSmartAdaptationToggle(),
        ],
      ),
    );
  }

  Widget _intervalTile(String number, String label, bool isSelected) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : cardGrey,
        border: isSelected ? Border.all(color: darkGreen, width: 1.5) : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: darkGreen,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmartAdaptationToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SMART ADAPTATION",
                  style: TextStyle(
                    color: accentBrown,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Weather-based override",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "Automatically skip if rain >80%",
                  style: TextStyle(color: textGrey, fontSize: 11),
                ),
              ],
            ),
          ),
          Switch(value: true, onChanged: (v) {}, activeColor: darkGreen),
        ],
      ),
    );
  }

  Widget _buildHydrationHealthCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const Text(
            "Hydration Health",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 140,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 12,
                  backgroundColor: cardGrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(darkGreen),
                ),
              ),
              const Column(
                children: [
                  Text(
                    "75%",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "OPTIMAL RANGE",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: darkGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Based on current soil sensors and last\nwatering cycle.",
            textAlign: TextAlign.center,
            style: TextStyle(color: textGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentHistorySection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardGrey,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.history, color: darkGreen),
              SizedBox(width: 12),
              Text(
                "Recent History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _historyItem(
            "Aug 22, 2023",
            "Manual: 4.2 Liters",
            "YESTERDAY",
            Icons.check_circle_outline,
          ),
          _historyItem(
            "Aug 20, 2023",
            "Auto: 4.5 Liters",
            "3 DAYS AGO",
            Icons.autorenew,
          ),
          _historyItem(
            "Aug 18, 2023",
            "Auto: 4.5 Liters",
            "5 DAYS AGO",
            Icons.autorenew,
          ),
        ],
      ),
    );
  }

  Widget _historyItem(
    String date,
    String subtitle,
    String timeAgo,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: cardGrey,
            child: Icon(icon, color: darkGreen, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  subtitle,
                  style: const TextStyle(color: textGrey, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            timeAgo,
            style: const TextStyle(
              color: textGrey,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      selectedItemColor: darkGreen,
      unselectedItemColor: textGrey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.grass), label: 'CROPS'),
        BottomNavigationBarItem(icon: Icon(Icons.opacity), label: 'WATERING'),
        BottomNavigationBarItem(
          icon: Icon(Icons.agriculture_outlined),
          label: 'HARVESTS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          label: 'ANALYTICS',
        ),
      ],
    );
  }
}
