
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Mark all as read',
                style: TextStyle(color: Colors.green),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          notificationCard(
            'Watering Overdue (Plot B)',
            'Plot B soil moisture has dropped below 15%.',
            '14m ago',
            Icons.water_drop,
            Colors.red,
          ),
          notificationCard(
            'Harvest Window Opening',
            'Tomato yield in Greenhouse 4 is approaching peak ripeness.',
            '2h ago',
            Icons.agriculture,
            Colors.orange,
          ),
          notificationCard(
            'Low Soil Moisture',
            'Sensor S-402 detected low soil moisture levels.',
            '5h ago',
            Icons.warning,
            Colors.yellow,
          ),
          notificationCard(
            'Heavy Rain Expected',
            '30mm precipitation forecast for tomorrow.',
            'Yesterday',
            Icons.cloud,
            Colors.blue,
          ),
          notificationCard(
            'Task Completed: Soil Testing',
            'Automated lab results uploaded successfully.',
            'Oct 24',
            Icons.check_circle,
            Colors.green,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'WEEKLY SUMMARY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '32 Alerts Resolved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your farm efficiency increased by 12% this week.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget notificationCard(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            subtitle,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
