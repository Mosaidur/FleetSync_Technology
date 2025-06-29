import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureRetype = true;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    if (_formKey.currentState!.validate()) {
      // Simulate password update logic here, e.g. call API

      // After successful update, navigate to homepage based on saved role
      final prefs = await SharedPreferences.getInstance();
      final role = prefs.getString('role') ?? '';
      print(role);

      String route = '/'; // fallback route
      switch (role.toLowerCase()) {
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark ? Colors.white : Colors.black;
    final scaffoldBgColor = isDark ? Colors.black : Colors.white;
    final buttonColor = AppColors.themeGreen;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        title: Text('Change Password',style: TextStyle(color:buttonColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: buttonColor,),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black, // or use textColor if you defined it
        titleTextStyle: const TextStyle(
          color: Colors.black, // or use textColor
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: Colors.black), // or use textColor
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: oldPasswordController,
                  label: 'Old Password',
                  obscureText: _obscureOld,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureOld ? Icons.visibility_off : Icons.visibility,
                      color: textColor.withOpacity(0.6),
                    ),
                    onPressed: () => setState(() => _obscureOld = !_obscureOld),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: newPasswordController,
                  label: 'New Password',
                  obscureText: _obscureNew,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNew ? Icons.visibility_off : Icons.visibility,
                      color: textColor.withOpacity(0.6),
                    ),
                    onPressed: () => setState(() => _obscureNew = !_obscureNew),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: retypePasswordController,
                  label: 'Retype Password',
                  obscureText: _obscureRetype,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureRetype ? Icons.visibility_off : Icons.visibility,
                      color: textColor.withOpacity(0.6),
                    ),
                    onPressed: () => setState(() => _obscureRetype = !_obscureRetype),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _updatePassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Update Password',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
