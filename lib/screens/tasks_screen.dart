import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyTasksPage extends StatelessWidget {
  const DailyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5EF),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2E7D32),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP BAR
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E6A1F),
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

                const SizedBox(height: 26),

                // TITLE
                const Text(
                  "Daily Tasks",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                const Text(
                  "12th August • 4 tasks remaining for today",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                const SizedBox(height: 24),

                // STATUS CARDS
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0D9),
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: const Text(
                                "PROGRESS",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                const Text(
                                  "64%",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Container(
                                    height: 6,

                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF2E7D32),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),

                                        const Expanded(
                                          flex: 4,
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0D9),
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: const Text(
                                "PRIORITY",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "3",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(width: 6),

                                Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "High Alert",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // MORNING
                sectionTitle(Icons.wb_sunny_outlined, "Morning"),

                const SizedBox(height: 16),

                taskTile(
                  title: "Water Plot A-4",
                  subtitle: "Ensure 15L drip saturation for heirloom tomatoes",
                  priority: "HIGH",
                  priorityColor: Colors.red,
                ),

                const SizedBox(height: 14),

                taskTile(
                  title: "Check Soil pH",
                  subtitle: "Target 6.5 for the berry patch north wing",
                  priority: "MEDIUM",
                  priorityColor: Colors.orange,
                ),

                const SizedBox(height: 28),

                // AFTERNOON
                sectionTitle(Icons.wb_sunny, "Afternoon"),

                const SizedBox(height: 16),

                taskTile(
                  title: "Clean Seed Trays",
                  subtitle: "Sanitize batch 402 for winter kale sowing",
                  priority: "LOW",
                  priorityColor: Colors.grey,
                ),

                const SizedBox(height: 14),

                completedTaskTile(),

                const SizedBox(height: 28),

                // EVENING
                sectionTitle(Icons.nights_stay_outlined, "Evening"),

                const SizedBox(height: 16),

                taskTile(
                  title: "Secure Greenhouses",
                  subtitle:
                      "Ensure vents are closed, nightly frost warning active",
                  priority: "HIGH",
                  priorityColor: Colors.red,
                ),

                const SizedBox(height: 40),

                // TIP CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F3E1),
                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.eco_outlined,
                              color: Color(0xFF2E7D32),
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Yield Forecast Tip",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2E7D32),
                                  ),
                                ),

                                SizedBox(height: 10),

                                Text(
                                  "Based on today's soil pH readings and the upcoming humidity spike, we recommend adjusting the nutrient mix for Plot B-2 by 15% tomorrow.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Adjust Plan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // SECTION TITLE
  static Widget sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFB26B00), size: 20),

        const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 10),

        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }

  // TASK TILE
  static Widget taskTile({
    required String title,
    required String subtitle,
    required String priority,
    required Color priorityColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,

            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: priorityColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Text(
                        priority,
                        style: TextStyle(
                          color: priorityColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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

          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }

  // COMPLETED TILE
  static Widget completedTaskTile() {
    return Opacity(
      opacity: 0.45,

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),

        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,

              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(6),
              ),

              child: const Icon(Icons.check, size: 16, color: Colors.white),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Apply Neem Oil",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Preventative spray for aphids rows 12–18",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

              decoration: BoxDecoration(
                color: Color(0xFFFFF0D9),
                borderRadius: BorderRadius.circular(10),
              ),

              child: const Text(
                "MEDIUM",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 10),

            const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  // NAV ITEM
  static Widget navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: active ? const Color(0xFF2E7D32) : Colors.transparent,

            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(icon, color: active ? Colors.white : Colors.grey),
        ),

        const SizedBox(height: 5),

        Text(
          label,
          style: TextStyle(
            color: active ? const Color(0xFF2E7D32) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
