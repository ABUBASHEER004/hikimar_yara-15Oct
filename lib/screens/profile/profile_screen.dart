import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hikimar_yara/screens/audio_stories_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    Color? color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: (color ?? Colors.green).withOpacity(.15),
          child: Icon(icon, color: color ?? Colors.green),
        ),
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green,
              child: Icon(Icons.child_care, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Hikimar Yara",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Learn • Listen • Grow",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                statCard("Stories", "10", Icons.menu_book, Colors.green),

                const SizedBox(width: 12),

                statCard("Favorites", "0", Icons.favorite, Colors.red),
              ],
            ),

            const SizedBox(height: 30),

            buildTile(
              icon: Icons.favorite,
              title: "Favorite Stories",
              subtitle: "View saved stories",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No favorite stories yet")),
                );
              },
            ),

            buildTile(
              icon: Icons.history,
              title: "Reading History",
              subtitle: "Continue reading",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reading history is empty")),
                );
              },
            ),

            buildTile(
              icon: Icons.volume_up,
              title: "Audio Stories",
              subtitle: "Listen anytime",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AudioStoriesScreen()),
                );
              },
            ),
            buildTile(
              icon: Icons.notifications,
              title: "Notifications",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No notifications")),
                );
              },
            ),

            buildTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Dark mode coming soon")),
                );
              },
            ),

            buildTile(
              icon: Icons.share,
              title: "Share App",
              onTap: () {
                Share.share(
                  "Download Hikimar Yara:\nhttps://play.google.com/store/apps/details?id=com.example.hikimaryara",
                );
              },
            ),

            buildTile(
              icon: Icons.star_rate,
              title: "Rate App",
              onTap: () async {
                final url = Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.example.hikimaryara",
                );

                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
            ),

            buildTile(
              icon: Icons.info_outline,
              title: "About Hikimar Yara",
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Hikimar Yara",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "© 2026 Hikimar Yara",
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
