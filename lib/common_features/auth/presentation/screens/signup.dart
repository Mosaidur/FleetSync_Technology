import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      //       onPressed: () => themeProvider.toggleTheme(),
      //       color: isDark ? Colors.white : Colors.black,
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.themeGreen : AppColors.themeGreen,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Create an account or log in to explore \nabout our app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(fontSize: 14,color: textColor,),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: firstNameController,
                          label: '',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(fontSize: 14,color: textColor,),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: lastNameController,
                          label: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: phoneController,
                label: '',
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("Verify tapped");
                    Navigator.pushNamed(context, '/otpVerify');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Verify'),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Go to Log In screen");
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Log In",
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
      ),
    );
  }
}
