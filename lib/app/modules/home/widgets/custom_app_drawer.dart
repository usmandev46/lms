import 'package:flutter/material.dart';
import 'package:lms/app/core/constants/app_colors.dart';

class CustomAppDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;

  const CustomAppDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color:  Theme.of(context).colorScheme.primary),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 12),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18)),
                    Text(email,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),

          _drawerTile(Icons.person_outline, "Profile", () {}),
          _drawerTile(Icons.book_outlined, "My Subjects", () {}),
          _drawerTile(Icons.event_note_outlined, "Events", () {}),
          _drawerTile(Icons.settings_outlined, "Settings", () {}),

          const Spacer(),

          _drawerTile(
            Icons.logout,
            "Logout",
                () {},
            isLogout: true,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerTile(
      IconData icon,
      String title,
      VoidCallback onTap, {
        bool isLogout = false,
      }) {
    return ListTile(
      leading: Icon(icon,
          color: isLogout ? Colors.red : Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
