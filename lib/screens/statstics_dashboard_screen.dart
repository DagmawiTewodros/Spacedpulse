import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F5EF),
      child: SafeArea(
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

                const SizedBox(height: 26),

                const Text(
                  "ANALYTICS ENGINE",
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    color: Color(0xFFB37A32),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Productivity\nDashboard",
                  style: TextStyle(
                    fontSize: 38,
                    height: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFF215A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: const [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.white,
                          ),

                          SizedBox(width: 8),

                          Text(
                            "Last 12 Months",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFF215A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: const [
                          Icon(
                            Icons.download_outlined,
                            size: 16,
                            color: Colors.white,
                          ),

                          SizedBox(width: 8),

                          Text(
                            "Export Report",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    Expanded(
                      child: statCard(
                        "TOTAL YIELD",
                        "1,284",
                        "TONS",
                        "+ 12.5% from last season",
                        Icons.eco_outlined,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: statCard(
                        "RESOURCE EFFICIENCY",
                        "94.2",
                        "%",
                        "Optimal usage maintained",
                        Icons.water_drop_outlined,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Productivity\nTrend",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Spacer(),

                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ),

                          SizedBox(width: 5),

                          Text(
                            "CURRENT",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),

                          SizedBox(width: 14),

                          CircleAvatar(radius: 5, backgroundColor: Colors.grey),

                          SizedBox(width: 5),

                          Text(
                            "PROJECTED",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        height: 180,

                        child: CustomPaint(
                          painter: GraphPainter(),
                          child: Container(),
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
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Planted vs\nHarvested",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Comparison by major crop category",
                        style: TextStyle(color: Colors.grey, height: 1.4),
                      ),

                      const SizedBox(height: 20),

                      cropBar("CASH CROPS", 0.92, 0.85),

                      const SizedBox(height: 18),

                      cropBar("VEGETABLES", 0.81, 0.76),

                      const SizedBox(height: 18),

                      cropBar("FRUIT ORCHARDS", 0.73, 0.69),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Crop Distribution",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Allocation by land usage",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 24),

                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 160,

                              child: CircularProgressIndicator(
                                value: 1,
                                strokeWidth: 18,
                                color: const Color(0xFF2E7D32),
                                backgroundColor: Colors.orange.shade300,
                              ),
                            ),

                            Column(
                              children: const [
                                Text(
                                  "3,240",
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2E7D32),
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "TOTAL ACRES",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          legendItem(Colors.green, "Wheat (35%)"),

                          legendItem(Colors.orange, "Corn (30%)"),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          legendItem(Colors.lightGreen, "Soy (15%)"),

                          legendItem(Colors.brown, "Other (20%)"),
                        ],
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
                    borderRadius: BorderRadius.circular(28),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Recent Harvest Logs",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      tableHeader(),

                      const Divider(),

                      harvestRow(
                        "04\nOct\n2023",
                        "North\nField-A",
                        "Golden\nWheat",
                        "124 Tons",
                      ),

                      const Divider(),

                      harvestRow(
                        "02\nOct\n2023",
                        "Valley\nBeds-01",
                        "Organic\nCorn",
                        "82 Tons",
                      ),

                      const Divider(),

                      harvestRow(
                        "01\nOct\n2023",
                        "East\nSlope",
                        "Heirloom\nTomatoes",
                        "12 Tons",
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

  static Widget statCard(
    String title,
    String value,
    String unit,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

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
                    fontSize: 10,
                    letterSpacing: 1.5,
                    color: Color(0xFFB37A32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Icon(icon, color: Colors.grey.shade400),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 4),

              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(unit, style: const TextStyle(color: Colors.grey)),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.arrow_upward, size: 14, color: Colors.green),

              const SizedBox(width: 5),

              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget cropBar(String title, double greenValue, double orangeValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Container(
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${(greenValue * 100).toInt()}% RATIO",
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),

            Text(
              "${(orangeValue * 100).toInt()}% RATIO",
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  static Widget legendItem(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),

        const SizedBox(width: 6),

        Text(text),
      ],
    );
  }

  static Widget tableHeader() {
    return Row(
      children: const [
        Expanded(
          flex: 2,
          child: Text(
            "DATE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),

        Expanded(
          flex: 3,
          child: Text(
            "FIELD",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),

        Expanded(
          flex: 3,
          child: Text(
            "CROP TYPE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),

        Expanded(
          flex: 2,
          child: Text(
            "QUANTITY",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  static Widget harvestRow(String date, String field, String crop, String qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          Expanded(flex: 2, child: Text(date)),

          Expanded(flex: 3, child: Text(field)),

          Expanded(flex: 3, child: Text(crop)),

          Expanded(flex: 2, child: Text(qty)),
        ],
      ),
    );
  }

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

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), gridPaint);
    }

    final linePaint = Paint()
      ..color = const Color(0xFF2E7D32)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, 120);
    path.quadraticBezierTo(30, 120, 50, 110);
    path.quadraticBezierTo(70, 100, 90, 90);
    path.quadraticBezierTo(120, 85, 140, 92);
    path.quadraticBezierTo(170, 80, 200, 70);

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
