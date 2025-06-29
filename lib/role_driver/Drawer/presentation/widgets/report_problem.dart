import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class ReportProblemPage extends StatefulWidget {
  const ReportProblemPage({super.key});

  @override
  State<ReportProblemPage> createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  final TextEditingController reportProblemController = TextEditingController();

  @override
  void dispose() {
    reportProblemController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    final problemText = reportProblemController.text.trim();
    if (problemText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write down the problem you are facing')),
      );
      return;
    }

    // TODO: Submit logic (e.g., send to backend)

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Problem reported successfully!')),
    );

    // Navigate based on saved role
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('role')?.toLowerCase() ?? '';

    String route = '/'; // fallback
    switch (role) {
      case 'driver':
        route = '/driverHome';
        break;
      case 'company':
        route = '/companyHomeScreen';
        break;
      case 'mechanics':
        route = '/mechanicHomeScreen';
        break;
      case 'fuel provider':
        route = '/fuelProviderHomeScreen';
        break;
      case 'cook':
        route = '/cookHomeScreen';
        break;
    }

    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final buttonColor = AppColors.themeGreen;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a Problem'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: buttonColor),
        titleTextStyle: TextStyle(color: buttonColor, fontSize: 20, fontWeight: FontWeight.w600),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: buttonColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Write down the problem you are facing", style: TextStyle(color: textColor, fontSize: 14),),
              const SizedBox(height: 20),
              TextField(
                controller: reportProblemController,
                minLines: 6,
                maxLines: 10,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.themeGreen, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Send Report',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
