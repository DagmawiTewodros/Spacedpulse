import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F0),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                context.go('/journal_screen');
              },

              child: navItem(Icons.menu_book_outlined, "JOURNAL", false),
            ),

            GestureDetector(
              onTap: () {
                context.go('/tasks_screen');
              },

              child: navItem(Icons.checklist_rounded, "TASKS", false),
            ),

            GestureDetector(
              onTap: () {
                context.go('/statstics_dashboard_screen');
              },

              child: navItem(
                Icons.insert_chart_outlined_rounded,
                "DASHBOARD",
                false,
              ),
            ),

            GestureDetector(
              onTap: () {
                context.go('/calendar_screen');
              },

              child: navItem(Icons.calendar_month_outlined, "EVENTS", false),
            ),

            GestureDetector(
              onTap: () {
                context.go('/weather_screen');
              },

              child: navItem(Icons.cloud_rounded, "WEATHER", true),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= TOP BAR =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                            'assets/images/Background+Shadow.png',
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          "FarmKeeper",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF215A2A),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        context.go('/notifications_screen');
                      },

                      child: const Icon(
                        Icons.notifications_none,
                        color: Color(0xFF215A2A),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= WEATHER MAIN CARD =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),

                    gradient: const LinearGradient(
                      colors: [Color(0xFF063B12), Color(0xFF0E5D1F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white70,
                            size: 18,
                          ),

                          SizedBox(width: 6),

                          Text(
                            "Central Valley Farms, Sector B",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "24°",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 58,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 10),

                              Text(
                                "Mostly",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                "Sunny",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "Feels like 26°",
                                style: TextStyle(color: Colors.white70),
                              ),

                              Text(
                                "Humidity 42%",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ================= ALERT BOX =================
                      Container(
                        padding: const EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(22),
                        ),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE7C7),
                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: const Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.orange,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Localized Tip",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  Text(
                                    "Perfect time for fertilizing before rain. Expected shower at 04:00 PM will help nutrient absorption.",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // ================= WEATHER STATS =================
                Row(
                  children: [
                    Expanded(
                      child: weatherStatCard(
                        "18%",
                        "Moisture Level",
                        "SOIL",
                        Icons.water_drop_outlined,
                        Colors.orange,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: weatherStatCard(
                        "12",
                        "km/h NW",
                        "WIND",
                        Icons.air,
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: weatherStatCard(
                        "6.2",
                        "High UV",
                        "UV INDEX",
                        Icons.wb_sunny_outlined,
                        Colors.orange,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: 110,
                  child: weatherStatCard(
                    "2mm",
                    "Expected today",
                    "PRECIP",
                    Icons.cloud_queue_outlined,
                    Colors.green,
                  ),
                ),

                const SizedBox(height: 28),

                // ================= FORECAST TITLE =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "5-Day Forecast",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Hourly View",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ================= FORECAST GRID =================
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.95,

                  children: const [
                    ForecastCard(
                      day: "MON",
                      temp: "26°",
                      low: "18°",
                      icon: Icons.wb_sunny_outlined,
                    ),

                    ForecastCard(
                      day: "TUE",
                      temp: "21°",
                      low: "16°",
                      icon: Icons.cloud_outlined,
                    ),

                    ForecastCard(
                      day: "WED",
                      temp: "19°",
                      low: "14°",
                      icon: Icons.cloud_outlined,
                    ),

                    ForecastCard(
                      day: "THU",
                      temp: "23°",
                      low: "19°",
                      icon: Icons.cloud_queue_outlined,
                    ),

                    ForecastCard(
                      day: "FRI",
                      temp: "28°",
                      low: "18°",
                      icon: Icons.wb_sunny_outlined,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ================= CROP CARD =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),

                        decoration: const BoxDecoration(
                          color: Color(0xFF2E7D32),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(Icons.grass, color: Colors.white),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Corn Growing Index",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              "Conditions are OPTIMAL for late-stage development.",
                              style: TextStyle(color: Colors.grey, height: 1.5),
                            ),

                            const SizedBox(height: 16),

                            Row(
                              children: [
                                smallChip("Growth Peak"),
                                const SizedBox(width: 10),
                                smallChip("Low Pest Risk"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ================= ALERT CARD =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),

                        decoration: const BoxDecoration(
                          color: Color(0xFFFF9800),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Alert: Wind Warning",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Winds up to 42km/h expected Thursday. Secure temporary netting.",
                              style: TextStyle(color: Colors.grey, height: 1.5),
                            ),

                            SizedBox(height: 14),

                            Text(
                              "VIEW DETAILS",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= WEATHER STAT CARD =================
  static Widget weatherStatCard(
    String value,
    String subtitle,
    String label,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),

          const SizedBox(height: 16),

          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 12),

          Text(
            label,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ================= NAV ITEM =================
  static Widget navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: active ? const Color(0xFF3D8B2F) : Colors.transparent,
            shape: BoxShape.circle,

            boxShadow: active
                ? [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                : [],
          ),

          child: Icon(
            icon,
            size: 24,
            color: active ? Colors.white : const Color(0xFF7B736D),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: active ? const Color(0xFF3D8B2F) : const Color(0xFF7B736D),
          ),
        ),
      ],
    );
  }

  // ================= CHIP =================
  static Widget smallChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

      decoration: BoxDecoration(
        color: const Color(0xFFF1F4ED),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

// ================= FORECAST CARD =================
class ForecastCard extends StatelessWidget {
  final String day;
  final String temp;
  final String low;
  final IconData icon;

  const ForecastCard({
    super.key,
    required this.day,
    required this.temp,
    required this.low,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFFECEFE5),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          Icon(icon, size: 34, color: const Color(0xFF2E7D32)),

          const Spacer(),

          Text(
            temp,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(low, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
