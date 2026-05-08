import 'package:flutter/material.dart';

void main() {
  runApp(const FarmKeeperApp());
}

class FarmKeeperApp extends StatelessWidget {
  const FarmKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(useMaterial3: true),

      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6EE),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: const Padding(
          padding: EdgeInsets.all(8),

          child: CircleAvatar(
            backgroundImage: AssetImage("assets/profile.png"),
          ),
        ),

        title: const Text(
          "FarmKeeper",
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF1B4332),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // WEATHER HEADER
            const MainWeatherHeader(),

            const SizedBox(height: 20),

            // METRICS GRID
            buildGridMetrics(),

            const SizedBox(height: 30),

            // SECTION TITLE
            buildSectionHeader("5-Day Forecast", "Hourly View"),

            const SizedBox(height: 15),

            // FORECAST ROW
            const ForecastRow(),

            const SizedBox(height: 25),

            // INFO CARD
            const InfoCard(
              title: "Corn Growing Index",
              content: "Conditions are OPTIMAL for late-stage development.",

              icon: Icons.grass,

              iconBgColor: Color(0xFF2D6A4F),

              chips: ["Growth Peak", "Low Pest Risk"],
            ),

            const SizedBox(height: 15),

            // ALERT CARD
            const InfoCard(
              title: "Alert: Wind Warning",

              content:
                  "Winds up to 45km/h expected Thursday. Secure temporary netting.",

              icon: Icons.warning_amber_rounded,

              iconBgColor: Colors.orange,

              showLink: true,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      bottomNavigationBar: buildBottomNav(),
    );
  }

  // METRICS GRID
  Widget buildGridMetrics() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      crossAxisCount: 2,

      childAspectRatio: 1.4,

      mainAxisSpacing: 15,
      crossAxisSpacing: 15,

      children: const [
        MetricCard(
          label: "SOIL",
          value: "18%",
          sub: "Moisture Level",
          icon: Icons.water_drop_outlined,
          progress: 0.18,
        ),

        MetricCard(
          label: "WIND",
          value: "12",
          sub: "km/h NW",
          icon: Icons.air,
          status: "STABLE",
        ),

        MetricCard(
          label: "UV INDEX",
          value: "6.2",
          sub: "High Risk",
          icon: Icons.wb_sunny_outlined,
          progress: 0.6,
          progressColor: Colors.orange,
        ),

        MetricCard(
          label: "PRECIP",
          value: "2mm",
          sub: "Expected Today",
          icon: Icons.cloudy_snowing,
        ),
      ],
    );
  }

  // SECTION HEADER
  Widget buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B4332),
          ),
        ),

        Text(
          action,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF2D6A4F),
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  // BOTTOM NAV
  Widget buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,

      selectedItemColor: const Color(0xFF2D6A4F),

      unselectedItemColor: Colors.grey,

      showUnselectedLabels: true,

      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'JOURNAL',
        ),

        const BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: 'TASKS',
        ),

        const BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'DASHBOARD',
        ),

        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'EVENTS',
        ),

        BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8),

            decoration: const BoxDecoration(
              color: Color(0xFF2D6A4F),
              shape: BoxShape.circle,
            ),

            child: const Icon(Icons.cloud, color: Colors.white),
          ),

          label: 'WEATHER',
        ),
      ],
    );
  }
}

// MAIN WEATHER HEADER
class MainWeatherHeader extends StatelessWidget {
  const MainWeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B4332), Color(0xFF081C15)],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Colors.white, size: 16),

              Text(
                " Central Valley Farm, Sector B",

                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "24°",

                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [
                  SizedBox(height: 15),

                  Text(
                    "Mostly\nSunny",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),

                  Text(
                    "Feels like 26°",

                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),

                  Text(
                    "Humidity 42%",

                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),

              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.orange,
                      size: 20,
                    ),

                    SizedBox(width: 8),

                    Text(
                      "LOCALIZED TIP",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  "Perfect time for fertilizing before rain. Expected shower at 04:00 PM will help nutrient absorption.",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// METRIC CARD
class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String sub;

  final IconData icon;

  final double? progress;
  final String? status;

  final Color? progressColor;

  const MetricCard({
    super.key,

    required this.label,
    required this.value,
    required this.sub,
    required this.icon,

    this.progress,
    this.status,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Icon(icon, size: 20, color: const Color(0xFF2D6A4F)),

              Text(
                label,

                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ],
          ),

          const Spacer(),

          Text(
            value,

            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey)),

          if (progress != null) ...[
            const SizedBox(height: 8),

            LinearProgressIndicator(
              value: progress,

              backgroundColor: Colors.grey[200],

              color: progressColor ?? const Color(0xFF2D6A4F),

              minHeight: 4,
            ),
          ],

          if (status != null) ...[
            const SizedBox(height: 4),

            Text(
              status!,

              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// FORECAST ROW
class ForecastRow extends StatelessWidget {
  const ForecastRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> days = [
      {
        'day': 'MON',
        'icon': Icons.wb_cloudy_outlined,
        'high': '26°',
        'low': '18°',
      },

      {'day': 'TUE', 'icon': Icons.beach_access, 'high': '21°', 'low': '16°'},

      {'day': 'WED', 'icon': Icons.grain, 'high': '19°', 'low': '14°'},

      {'day': 'THU', 'icon': Icons.cloud_queue, 'high': '23°', 'low': '15°'},

      {
        'day': 'FRI',
        'icon': Icons.wb_sunny_outlined,
        'high': '28°',
        'low': '19°',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: days.map((d) {
        return Column(
          children: [
            Text(
              d['day'] as String,

              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 8),

            Icon(d['icon'] as IconData, color: const Color(0xFF2D6A4F)),

            const SizedBox(height: 8),

            Text(
              d['high'] as String,

              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            Text(
              d['low'] as String,

              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        );
      }).toList(),
    );
  }
}

// INFO CARD
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  final IconData icon;
  final Color iconBgColor;

  final List<String>? chips;

  final bool showLink;

  const InfoCard({
    super.key,

    required this.title,
    required this.content,

    required this.icon,
    required this.iconBgColor,

    this.chips,

    this.showLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xFFE8EFE5),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: Colors.white, size: 30),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  content,

                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),

                if (chips != null) ...[
                  const SizedBox(height: 10),

                  Row(
                    children: chips!.map((c) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Text(
                          c,

                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                if (showLink) ...[
                  const SizedBox(height: 10),

                  const Text(
                    "VIEW DETAILS",

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
