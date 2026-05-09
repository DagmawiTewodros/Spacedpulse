import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/confirmation_dialog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F1),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F7F1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {
              context.push('/settings_screen');
            },
          ),

          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              context.push('/notifications_screen');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF2E7D32),

                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'ABEBE BELAY D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Arsi Bale Zone, Oromia',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      badge('PREMIUM MEMBER', const Color(0xFF2E7D32)),

                      const SizedBox(width: 10),

                      badge('VERIFIED FARM', Colors.blue),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            infoCard('TOTAL ACREAGE', '1,240 Acres', Icons.landscape),

            infoCard(
              'MAIN CROPS',
              'Winter Wheat, Soybeans, Alfalfa',
              Icons.grass,
            ),

            const SizedBox(height: 20),

            // ListView.builder(
            //   itemCount: 2, // settingsData.lenght,
            //   shrinkWrap: true,
            //   itemBuilder: (context, i) {
            //     // final settingData = settingsData[i];
            //     return settingsTile('Manage Land Assets', Icons.map);
            //   },
            // ),
            settingsTile('Manage Land Assets', Icons.map),

            settingsTile('Change PIN', Icons.lock),

            settingsTile('Setup Face ID', Icons.face),

            settingsTile('Two-Factor Authentication', Icons.security),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Text(
                'Ensure your security protocols are up to date to protect sensitive crop yield data and financial records.',
                style: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ConfirmationDialog.signOut(
                      route: '/create_account_screen',
                    ),
                  );
                },

                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget infoCard(String title, String value, IconData icon) {
    return Card(
      color: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: Icon(icon, color: const Color(0xFF2E7D32), size: 30),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),

          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget settingsTile(String title, IconData icon) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2E7D32)),

        title: Text(title, style: const TextStyle(color: Colors.black)),

        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
