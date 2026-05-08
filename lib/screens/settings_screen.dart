import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool darkMode = true;
  bool pushNotifications = true;
  bool weatherAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Thomas Miller',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Head of Operations',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 6),
                      Chip(
                        label: Text('PREMIUM PLAN'),
                        backgroundColor: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            sectionTitle('APP PREFERENCES'),
            
            buildListTile(
              'Language',
              'Current: English',
              Icons.language,
            ),
            const SizedBox(height: 20),
            sectionTitle('ALERTS & NOTIFICATIONS'),
            buildSwitchTile(
              'Push Notifications',
              'Real-time system updates',
              pushNotifications,
              (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            buildSwitchTile(
              'Weather Alerts',
              'Extreme condition warnings',
              weatherAlerts,
              (value) {
                setState(() {
                  weatherAlerts = value;
                });
              },
            ),
            const SizedBox(height: 20),
            sectionTitle('SECURITY'),
            buildListTile(
              'Enabled PIN Code',
              '4-digit access code',
              Icons.lock,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text('Sign Out'),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'FARMKEEPER V2.4.1 - STABLE',
                style: TextStyle(color: Colors.white54),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SwitchListTile(
        activeColor: Colors.green,
        value: value,
        onChanged: onChanged,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
      ),
    );
  }
}
