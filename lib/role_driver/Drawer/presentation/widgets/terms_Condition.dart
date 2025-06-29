import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  final String termsText = '''
By using FleetSync, you agree to these terms:

Eligibility: You must be 18+ to use the app. Provide accurate info and keep your account secure.

User Roles: You register as a Driver, Company, Mechanic, Cook, or Fuel Provider. Phone verification and approvals apply.

Content: You are responsible for what you share. No illegal, harmful, or misleading content allowed.

Listings & Transactions: Truck sales, job postings, and fuel offers are user-provided. FleetSync isn’t responsible for transactions.

Subscriptions: Some features require payment after a trial. Non-payment may limit your access.

Privacy: Contact details are private until you connect. Communications are secured within the app.

Liability: FleetSync provides the app “as is.” We aren’t liable for damages from using the app.

Termination: You can delete your account anytime. Violations may lead to suspension.

Updates: Terms may change. Continued use means you accept updates.

Law: Governed by [Insert Jurisdiction] laws.
''';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final buttonColor = AppColors.themeGreen;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
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
            termsText,
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
