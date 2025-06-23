import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class GetYourPackageScreen extends StatelessWidget {
  const GetYourPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;
    final packdgeType = "Monthly";
    final packadgePrice = "\$4.99/month";

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
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Get Your Package",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.themeGreen,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Unlock premium features to get more jobs, exclusive offers, and priority support on FleetSync.",
                style: TextStyle(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20.0),
              child: Container(
                // height: 150,
                // width: 300,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2B2B37) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    if (!isDark)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          packdgeType,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          packadgePrice,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.themeGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // logics are there
                          print("buy now");

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? Colors.white : Colors.black,
                          foregroundColor: isDark ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text("Buy Now"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Start Trial logic
                    print("Start 30 Days Free Trial");
                    Navigator.pushNamed(context, '/subscriberWelcomeScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Start 30 Days Free Trial"),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Cancel"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
