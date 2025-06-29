import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriberWelcomeScreen extends StatelessWidget {
  const SubscriberWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png', // Replace with your logo asset path
                height: 100,
              ),
              const SizedBox(height: 32),

              // Welcome Text
              Text(
                "Welcome to\nFleetSync Community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),

              // Sub Text
              const Text(
                "Your Mechanic profile is now active.",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.themeGreen,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Let's Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final role = prefs.getString('role');
                    print('Retrieved role: $role');

                    if (role == 'driver') {
                      Navigator.pushReplacementNamed(context, '/driverHome');
                    } else if (role == 'company') {
                      Navigator.pushReplacementNamed(context, '/companyHomeScreen');
                    } else if (role == 'mechanics') {
                      Navigator.pushReplacementNamed(context, '/mechanicHomeScreen');
                    } else if (role == 'fuel provider') {
                      Navigator.pushReplacementNamed(context, '/fuelProviderHomeScreen');
                    } else if (role == 'cook') {
                      Navigator.pushReplacementNamed(context, '/cookHomeScreen');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No role found. Please select again.')),
                      );
                    }
                  },


                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Let's Get Started", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
