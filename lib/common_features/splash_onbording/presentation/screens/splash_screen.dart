import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateFromSplash();
  }

  Future<void> _navigateFromSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final role = prefs.getString('role');

    String targetRoute = '/login';

    if (isLoggedIn && role != null) {
      switch (role) {
        case 'driver':
          targetRoute = '/driverHome';
          break;
        case 'fuel_provider':
          targetRoute = '/fuelProviderHomeScreen';
          break;
        case 'cook':
          targetRoute = '/cookHomeScreen';
          break;
        case 'company':
          targetRoute = '/companyHomeScreen';
          break;
        case 'mechanics':
          targetRoute = '/mechanicHomeScreen';
          break;
      }
    }

    Navigator.pushReplacementNamed(context, targetRoute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'FleetSync\nTechnology',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
