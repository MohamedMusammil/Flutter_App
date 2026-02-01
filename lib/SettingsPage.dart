import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Account Settings"),
            _buildSettingsGroup([
              _settingsTile(
                Icons.person_outline,
                "Edit Profile",
                "Change your name and info",
              ),
              _settingsTile(
                Icons.notifications_none,
                "Notifications",
                "Manage alerts and updates",
              ),
              _settingsTile(
                Icons.security,
                "Security",
                "Change password and 2FA",
              ),
            ]),

            const SizedBox(height: 25),
            _buildSectionTitle("Preferences"),
            _buildSettingsGroup([
              _settingsTile(Icons.language, "Language", "English (US)"),
              _settingsTile(
                Icons.dark_mode_outlined,
                "Appearance",
                "Light Mode",
              ),
              _settingsTile(
                Icons.location_on_outlined,
                "Region",
                "Colombo, Sri Lanka",
              ),
            ]),

            const SizedBox(height: 25),
            _buildSectionTitle("Support & About"),
            _buildSettingsGroup([
              _settingsTile(
                Icons.help_outline,
                "Help Center",
                "FAQs and support",
              ),
              _settingsTile(Icons.description_outlined, "Terms of Service", ""),
              _settingsTile(Icons.info_outline, "App Version", "2.0.1"),
            ]),

            const SizedBox(height: 40),

            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.withOpacity(0.1),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          int idx = entry.key;
          Widget tile = entry.value;

          return Column(
            children: [
              tile,
              if (idx != children.length - 1)
                const Divider(height: 1, indent: 60, endIndent: 20),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _settingsTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E40AF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF1E40AF), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
