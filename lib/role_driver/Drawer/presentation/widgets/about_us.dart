import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us', style: TextStyle(color: AppColors.themeGreen,),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.themeGreen,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Text(
          '''
FleetSync is a comprehensive mobile platform dedicated to revolutionizing the U.S. trucking and logistics industry. Our mission is to unify the entire ecosystem—professional drivers, truck owners, logistics companies, mechanics, cooks, and fuel providers—into one seamless, easy-to-use app.

By connecting diverse professionals and services in a single platform, FleetSync simplifies communication, job searching, service discovery, and transactions across the trucking community. We provide tools that enable fast, secure, and paperless interactions tailored specifically to the needs of the trucking industry.

Our app offers role-specific profiles, trusted rating systems, and secure private messaging to build a reliable network you can count on. Whether you're looking for your next job, seeking trustworthy roadside assistance, buying or selling trucks, or searching for fuel discounts, FleetSync puts everything you need right at your fingertips.

Together, we are driving the future of trucking — efficient, connected, and empowered.
  ''',
          style: TextStyle(fontSize: 16, height: 1.5, color: textColor),
        )
      ),
    );
  }
}
