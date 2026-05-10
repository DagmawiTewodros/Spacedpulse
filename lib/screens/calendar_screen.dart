import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FarmKeeperPage extends StatelessWidget {
  const FarmKeeperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            "assets/images/User profile photo.png",
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          "FarmKeeper",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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

                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26),
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "October 2023",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "Autumn Harvest Season",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),

                          Row(
                            children: const [
                              Icon(Icons.chevron_left),
                              SizedBox(width: 10),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("MON"),
                          Text("TUE"),
                          Text("WED"),
                          Text("THU"),
                          Text("FRI"),
                          Text("SAT"),
                          Text("SUN"),
                        ],
                      ),

                      const SizedBox(height: 18),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 28,

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),

                        itemBuilder: (context, index) {
                          int day = index + 1;

                          bool selected = day == 11;
                          bool green = day == 12;

                          return Container(
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xFF1E6A1F)
                                  : green
                                  ? const Color(0xFFDDF1D7)
                                  : const Color(0xFFF1F1F1),

                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: Center(
                              child: Text(
                                "$day",
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Daily Agenda - Oct 11",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "+ New Task",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                taskCard(
                  Icons.water_drop_outlined,
                  Colors.green,
                  const Color(0xFFDDF1D7),
                  "Irrigation Cycle:\nNorth Field",
                  "Automatic cycle for corn and soy crops. Check flow sensors for blockage.",
                  "08:00\nAM",
                ),

                const SizedBox(height: 16),

                taskCard(
                  Icons.inventory_2_outlined,
                  Colors.orange,
                  const Color(0xFFFFE9C9),
                  "Fertilizer\nDelivery",
                  "Organic NPK delivery from GreenTrade. Confirm receipt and storage in Shed 4.",
                  "11:30\nAM",
                ),

                const SizedBox(height: 16),

                taskCard(
                  Icons.analytics_outlined,
                  Colors.green,
                  const Color(0xFFE8F1E5),
                  "Soil Health\nAnalysis",
                  "Reviewing pH levels and nutrient density maps for the East Orchard.",
                  "02:00\nPM",
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: const Color(0xFF1E6A1F),
                    borderRadius: BorderRadius.circular(26),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Harvest Forecast",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Wheat is maturing 4 days faster than expected due to recent heat wave.",
                        style: TextStyle(color: Colors.white70, height: 1.5),
                      ),

                      SizedBox(height: 24),

                      Text(
                        "88%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "READINESS",
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Legend",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      SizedBox(height: 18),

                      Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.orange),
                          SizedBox(width: 10),
                          Text("Watering Schedule"),
                        ],
                      ),

                      SizedBox(height: 14),

                      Row(
                        children: [
                          Icon(Icons.crop_square, color: Colors.green),
                          SizedBox(width: 10),
                          Text("Harvest Window"),
                        ],
                      ),

                      SizedBox(height: 14),

                      Row(
                        children: [
                          Icon(Icons.warning_amber, color: Colors.red),
                          SizedBox(width: 10),
                          Text("Weather Alert"),
                        ],
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

  Widget taskCard(
    IconData icon,
    Color iconColor,
    Color iconBg,
    String title,
    String subtitle,
    String time,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),

            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, height: 1.4),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

            decoration: BoxDecoration(
              color: const Color(0xFFFFF2DF),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Text(
              time,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
