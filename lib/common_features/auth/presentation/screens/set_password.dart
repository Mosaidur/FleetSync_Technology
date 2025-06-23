import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;
  bool rememberMe = false;
  String? errorText;

  void validatePasswords() {
    final pass = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    setState(() {
      if (pass.length < 6) {
        errorText = 'Password must be at least 6 characters';
      } else if (pass != confirm) {
        errorText = 'Passwords do not match';
      } else {
        errorText = null;
        print('Password set: $pass');
        // Proceed with password setup logic


        Navigator.pushNamed(context, '/selectRole');



      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;

    final iconColor = isDark ? Colors.white70 : Colors.black45;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            color: isDark ? Colors.white : Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.themeGreen : AppColors.themeGreen,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Provide your Phone number to change \npassword.",
                style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Set Password
            Text(
              "Set Password",
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: passwordController,
              obscureText: obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: iconColor,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Confirm Password
            Text(
              "Confirm Password",
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: confirmPasswordController,
              obscureText: obscureConfirm,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureConfirm ? Icons.visibility : Icons.visibility_off,
                  color: iconColor,
                ),
                onPressed: () {
                  setState(() {
                    obscureConfirm = !obscureConfirm;
                  });
                },
              ),
            ),

            const SizedBox(height: 12),

            if (errorText != null)
              Text(
                errorText!,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 16),

            // Remember Me
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                      print(rememberMe);
                    });
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.themeGreen;
                    }
                    return Colors.transparent;
                  }),
                  checkColor: isDark ? Colors.black : Colors.white,
                ),
                Text(
                  'Remember me',
                  style: TextStyle(color: textColor),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Set Now Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: validatePasswords,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Set Now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
