import 'package:fleetsynctechnology/common_features/Registration%20from/presentation/screens/select_role_page.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/forgot_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/otpVerify.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass_otp.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/set_password.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/signup.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/login_screen.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/splash_screen.dart';
import 'package:fleetsynctechnology/role_company/Company%20Registration%20Form/presentation/screens/company_reg_form.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Registration%20Form/presentation/screens/reg_form_personal_info.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Registration%20Form/presentation/screens/reg_form_vehicle_info.dart';
import 'package:fleetsynctechnology/role_machanics/Machanics%20Registration%20Form/presentation/screens/machanics_reg_from.dart';
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
        // Role 1: Common
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otpVerify': (context) => const OtpVerificationScreen(),
        '/forgotPass': (context) => const ForgotPasswordScreen(),
        '/setPass': (context) => const SetPasswordScreen(),
        '/resetPass': (context) => const ResetPasswordScreen(),
        '/resetPassOTP': (context) => const ResetPasswordOtpScreen(),
        '/selectRole': (context) => const SelectRoleScreen(),

        // Role 2: Driver
        '/driverPersonalInfo': (context) => const DriverRegPersonalInfoScreen(),
        '/driverVehicleInfo': (context) => const DriverVehicleInfoScreen(),

        // Role 3: Company
        '/companyRegFormScreen': (context) => const CompanyRegFormScreen(),

        // Role 4: Mechanic
        '/mechanicRegFormScreen': (context) => const MechanicRegFormScreen(),

        // Role 5: Cooks
        // (Add screen route here when implemented)

        // Role 6: Fuel Provider
        // (Add screen route here when implemented)








        // Add other routes as needed
      },
    );
  }
}