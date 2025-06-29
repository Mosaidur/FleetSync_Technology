import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Added for logout logic
import 'package:fleetsynctechnology/config/theme.dart'; // Update path based on your project

class LogoutPopUp extends StatelessWidget {
  const LogoutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark ? Colors.black : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black;

    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are You Sure you want to log out?",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Logout logic from ListTile
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('isLoggedIn');
                          await prefs.remove('role');
                          Navigator.pop(context); // Close popup
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text('Yes'),
                      ),
                    ),

                    const SizedBox(width: 10),
                    SizedBox(
                      // width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close popup
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeRed,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text('No'),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}