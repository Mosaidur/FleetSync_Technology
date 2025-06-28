import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final List<Map<String, String>> mockUsers = [
    {"email": "driver", "password": "123456", "role": "driver"},
    {"email": "fuel provider", "password": "123456", "role": "fuel_provider"},
    {"email": "cook", "password": "123456", "role": "cook"},
    {"email": "company", "password": "123456", "role": "company"},
    {"email": "mechanics", "password": "123456", "role": "mechanics"},
  ];


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
      body: SingleChildScrollView(
        child: Padding(
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
                      Navigator.pushNamed(context, '/forgotPass');
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
                  onPressed: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text;
        
                    // Check credentials from mock data
                    final user = mockUsers.firstWhere(
                          (user) => user['email'] == email && user['password'] == password,
                      orElse: () => {},
                    );
        
                    if (user.isNotEmpty) {
                      final role = user['role'];
        
                      // Save to SharedPreferences
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      await prefs.setString('role', role!);
        
                      // Navigate based on role
                      switch (role) {
                        case 'driver':
                          Navigator.pushReplacementNamed(context, '/driverHome');
                          break;
                        case 'fuel_provider':
                          Navigator.pushReplacementNamed(context, '/fuelProviderHome');
                          break;
                        case 'cook':
                          Navigator.pushReplacementNamed(context, '/cookHome');
                          break;
                        case 'company':
                          Navigator.pushReplacementNamed(context, '/companyHome');
                          break;
                        case 'mechanics':
                          Navigator.pushReplacementNamed(context, '/mechanicsHome');
                          break;
                      }
                    } else {
                      // Invalid credentials
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid email or password")),
                      );
                    }
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
      ),
    );
  }
}
