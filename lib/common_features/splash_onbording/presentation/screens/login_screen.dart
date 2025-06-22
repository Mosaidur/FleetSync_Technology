import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true;

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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 130),
            Text(
              'Log In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.themeGreen,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Create an account or log in to explore \nabout our app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: textColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 32),

            // Custom Email Text Field
            CustomTextField(
              controller: emailController,
              label: 'Email',
            ),
            const SizedBox(height: 16),

            // Custom Password Text Field
            CustomTextField(
              controller: passwordController,
              label: 'Password',
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
            const SizedBox(height: 12),

            // Remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                TextButton(
                  onPressed: () {
                    // Forgot password logic
                    print("Forget Password?");
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: AppColors.themeRed,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.themeRed,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Sign In button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Login logic
                  print("Sign In");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Sign In'),
              ),
            ),

            const SizedBox(height: 24),

            // Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(color: textColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Register
                    print("Register Now");
                    Navigator.pushNamed(context, '/signup');

                  },
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                      color: AppColors.themeGreen,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.themeGreen,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
