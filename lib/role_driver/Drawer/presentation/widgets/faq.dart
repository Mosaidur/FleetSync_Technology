import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  final String faqText = '''
1. What is FleetSync?
FleetSync is a mobile app that connects truck drivers, companies, mechanics, cooks, and fuel providers to streamline jobs, services, and transactions in the trucking industry.

2. How do I register?
Choose your role, fill out the role-specific form, upload your avatar, and verify your phone via SMS to activate your account.

3. Can I be more than one role?
Currently, you can register with one role per account. You can create separate accounts for different roles if needed.

4. How does the rating system work?
Users rate each other after successful interactions. Ratings help build trust and appear on profiles, lists, and chats.

5. How do I find jobs or services?
Use the List or Discover (Map) tabs to browse users by role, location, and filters like verified status or active requests.

6. How do I buy or sell trucks?
Visit the Marketplace tab, select the Trucks section to browse listings or post your own truck for sale.

7. What are Fuel Cards?
Fuel cards offer discounts and credit lines for fuel purchases. Find providers and offers under the Marketplace’s Fuel Cards section.

8. Is my contact info safe?
Yes! Contact details are hidden until you accept a connection request, and all messaging happens securely within the app.

9. Are there subscription fees?
Yes, after a free trial, certain roles have monthly fees for full access. You’ll be notified before your trial ends.

10. How do I disable requests?
In your Profile settings, toggle “Disable Requests” to stop receiving connection requests while remaining visible.
''';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final buttonColor = AppColors.themeGreen;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: buttonColor),
        titleTextStyle: TextStyle(
          color: buttonColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: buttonColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Text(
            faqText,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
