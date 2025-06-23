import 'package:fleetsynctechnology/common_features/Registration%20from/presentation/screens/select_role_page.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/forgot_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/otpVerify.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass_otp.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/set_password.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/signup.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/login_screen.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/splash_screen.dart';
import 'package:fleetsynctechnology/role_company/Registration%20Form/presentation/screens/reg_form_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'shared/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Themed App',
      theme: themeProvider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otpVerify': (context) => const OtpVerificationScreen(),
        '/forgotPass': (context) => const ForgotPasswordScreen(),
        '/setPass': (context) => const SetPasswordScreen(),
        '/resetPass': (context) => const ResetPasswordScreen(),
        '/resetPassOTP': (context) => const ResetPasswordOtpScreen(),
        '/selectRole': (context) => const SelectRoleScreen(),
        '/driverPersonalInfo': (context) => const DriverRegPersonalInfoScreen(),
        // '/driverVehicleInfo' : (context) => const DriverVehicleInfoScreen(),
        // Add other routes as needed
      },
    );
  }
}