import 'package:flutter/material.dart';

class CropJournalPage extends StatelessWidget {
  const CropJournalPage({super.key});

  // Custom Color Palette from image_747ef6.png
  static const Color bgColor = Color(0xffF9FAF5);
  static const Color darkGreen = Color(0xff2A6F2B);
  static const Color textGrey = Color(0xff7A8677);
  static const Color headingBrown = Color(0xffA67C52);
  static const Color cardBg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // Custom AppBar with the matching profile icon
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff333333),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                  // Using an avatar that matches the character style in image_747ef6.png
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
          "FarmKeeper",
          style: TextStyle(
            color: darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: darkGreen,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "FIELD NOTES",
              style: TextStyle(
                color: headingBrown,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
            const Text(
              "Journal",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "A chronological record of your crop development, observations, and seasonal milestones.",
              style: TextStyle(color: textGrey, fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 24),

            // The All Entries / New Entry Bar
            _buildFilterAndActionRow(),

            const SizedBox(height: 30),

            // Timeline Content
            Stack(
              children: [
                // The vertical timeline line
                Positioned(
                  left: 20,
                  top: 0,
                  bottom: 0,
                  child: Container(width: 1.5, color: Colors.grey.shade300),
                ),
                Column(
                  children: [
                    _buildTimelineItem(
                      day: "22",
                      date: "THURSDAY, MAY 22",
                      title: "Fertilizer Applied",
                      tags: ["FERTILIZER", "WEATHER"],
                      description:
                          "Applied organic liquid seaweed fertilizer to the heirloom tomato plot. Weather was overcast, perfect for absorption without leaf burn risk.",
                      time: "08:30 AM",
                      location: "North Field (B2)",
                      isActive: false,
                    ),
                    _buildTimelineItem(
                      day: "19",
                      date: "MONDAY, MAY 19",
                      title: "First Sprouts",
                      tags: ["JOURNAL"],
                      description:
                          "The first rows of sweet corn have broken through the soil surface today! Germination looks very even across the entire plot.",
                      time: "07:15 AM",
                      isActive: true, // Green highlight
                    ),
                    _buildTimelineItem(
                      day: "15",
                      date: "THURSDAY, MAY 15",
                      title: "Pest Alert: Aphids",
                      tags: ["PESTS"],
                      description:
                          "Spotted a small cluster of aphids on the young cabbage leaves. Introduced ladybugs as a biological control measure.",
                      time: "05:40 PM",
                      isActive: false,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildFilterAndActionRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffE6EADF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              Text(
                "All",
                style: TextStyle(fontWeight: FontWeight.bold, color: darkGreen),
              ),
              Text("entries", style: TextStyle(color: darkGreen, fontSize: 10)),
            ],
          ),
        ),
        const SizedBox(width: 15),
        const Text(
          "May\n2024",
          style: TextStyle(
            color: textGrey,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const Spacer(),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkGreen,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            "New\nEntry",
            style: TextStyle(color: Colors.white, height: 1.1),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String day,
    required String date,
    required String title,
    required List<String> tags,
    required String description,
    required String time,
    String? location,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Circle Marker
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isActive ? darkGreen : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? darkGreen : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color: isActive ? Colors.white : darkGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Content Card
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: textGrey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: tags.map((t) => _buildTag(t)).toList(),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                          if (location != null) ...[
                            const SizedBox(width: 12),
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF0F4EC),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: darkGreen,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.menu_book, "Journal", isSelected: true),
          _navItem(Icons.checklist_rtl, "Tasks"),
          _navItem(Icons.bar_chart, "Dashboard"),
          _navItem(Icons.calendar_month, "Events"),
          _navItem(Icons.cloud_outlined, "Weather"),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? darkGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
            size: 26,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? darkGreen : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
