import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF1E1E2D) : Colors.white;
    bool profileVisibility = false ;

    return Drawer(
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(00),
              decoration: BoxDecoration(color: bgColor),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      // Handle camera icon tap here

                      Navigator.pop(context);

                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.close, color: textColor),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: DynamicImage(
                            imageUrl: 'https://i.pravatar.cc/150?img=4',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            borderRadius: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            // Handle camera icon tap here

                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: const Icon(Icons.camera_alt, size: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.themeGreen),
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text('Edit Profile', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),

            // Drawer Body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    _buildDrawerItem(Icons.brightness_6, "Themes",
                        trailing: Transform.scale(
                          scale: 0.7, // Adjust the scale (0.7 = 70% of original size)
                          child: Switch(
                            value: isDark,
                            onChanged: (_) => themeProvider.toggleTheme(),
                            activeColor: AppColors.themeGreen,
                          ),
                        ),

                        textColor: textColor),

                    _buildDrawerItem(Icons.visibility, "Profile Visibility",
                        trailing: Transform.scale(
                          scale: 0.7, // Adjust the scale (0.7 = 70% of original size)
                          child: Switch(
                            value: profileVisibility,
                            onChanged: (_) {},
                            activeColor: AppColors.themeGreen,
                          ),
                        ),
                        textColor: textColor),


                    _buildDrawerItem(Icons.language, "Language", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.bookmark, "Saved Posts", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.notifications, "Notifications", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.subscriptions, "Subscriptions", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.lock, "Change Password", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.info, "About Us", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.privacy_tip, "Privacy Policy", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.article, "Terms & Conditions", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.help_outline, "FAQ", textColor: textColor, onTap: (){}),
                    _buildDrawerItem(Icons.report_problem, "Report Problem", textColor: textColor, onTap: (){}),
                  ],
                ),
              ),
            ),

            // Drawer Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
                ),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('isLoggedIn');
                  await prefs.remove('role');
                  // You can also use prefs.clear(); to clear all saved data if you want

                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon,
      String title, {
        Widget? trailing,
        required Color textColor,
        VoidCallback? onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.themeGreen, size: 16),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 12)),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 14, color: textColor),
      onTap: onTap ?? () {},
    );
  }
}
