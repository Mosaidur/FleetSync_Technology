import 'package:fleetsynctechnology/common_features/Subscription/presentation/screens/subscriber_welcome.dart';
import 'package:fleetsynctechnology/common_features/Subscription/presentation/screens/subscription.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/forgot_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/otpVerify.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass_otp.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/set_password.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/reset_pass.dart';
import 'package:fleetsynctechnology/common_features/auth/presentation/screens/signup.dart';
import 'package:fleetsynctechnology/common_features/select%20role/presentation/screens/select_role_page.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/login_screen.dart';
import 'package:fleetsynctechnology/common_features/splash_onbording/presentation/screens/splash_screen.dart';
import 'package:fleetsynctechnology/role_company/Company%20Registration%20Form/presentation/screens/company_reg_form.dart';
import 'package:fleetsynctechnology/role_cooks/Cook%20Homepage/presentation/screens/cook_homescreen.dart';
import 'package:fleetsynctechnology/role_cooks/Cooks%20Registration%20Form/presentation/screens/cooks_reg_from.dart';
import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/directory_list.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/screens/driver_home_screen.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Registration%20Form/presentation/screens/reg_form_personal_info.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Registration%20Form/presentation/screens/reg_form_vehicle_info.dart';
import 'package:fleetsynctechnology/role_driver/Fuel%20Provider/presentation/widgets/fuel_provider_page.dart';
import 'package:fleetsynctechnology/role_driver/Map/presentation/widgets/map_main_page.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/screens/create_a_post.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/widgets/truck_sales_list.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/widgets/truck_sales_widget.dart';
import 'package:fleetsynctechnology/role_driver/chat/presentation/screens/messege_screen.dart';
import 'package:fleetsynctechnology/role_fule_provider/Fuel%20Provider%20Registration%20Form/presentation/screens/fuel_provider_reg_from.dart';
import 'package:fleetsynctechnology/role_fule_provider/fule%20provider%20Homepage/presentation/screens/fuel_provider_homescreen.dart';
import 'package:fleetsynctechnology/role_machanics/Machanics%20Homepage/presentation/screens/mechanic_homescreen.dart';
import 'package:fleetsynctechnology/role_machanics/Machanics%20Registration%20Form/presentation/screens/machanics_reg_from.dart';
import 'package:fleetsynctechnology/shared/widgets/dummy_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/theme.dart';
import 'shared/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final role = prefs.getString('role');

  String initialRoute = '/';
  if (isLoggedIn && role != null) {
    switch (role) {
      case 'driver':
        initialRoute = '/driverHome';
        break;
      case 'fuel provider':
        initialRoute = '/fuelProviderHomeScreen' ;
        break;
      case 'cook':
        initialRoute = '/cookHomeScreen';
        break;
      case 'company':
        initialRoute = '/companyHomeScreen';
        break;
      case 'mechanics':
        initialRoute =  '/mechanicHomeScreen';
        break;
    }
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(initialRoute: initialRoute),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Themed App',
      theme: themeProvider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      initialRoute:   initialRoute,
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
        '/getYourPackageScreen': (context) => GetYourPackageScreen(),
        '/subscriberWelcomeScreen': (context) => SubscriberWelcomeScreen(),

        // Role 2: Driver
        '/driverPersonalInfo': (context) => const DriverRegPersonalInfoScreen(),
        '/driverVehicleInfo': (context) => const DriverVehicleInfoScreen(),



        '/driverHome': (context) =>  DriverHomeScreen(),
        '/driverMap': (context) => const MapMainPage(),
        '/driverChats': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return MessageScreen(
            name: args['name'] ?? '',
            imageUrl: args['imageUrl'] ?? '',
          );
        },
        '/driverList': (context) => const DirectorListPage(),
        '/truckSales': (context) => const TruckSalesPage(),
        '/fuelCard': (context) => const FuelProviderListPage(),





        '/createSalePost' : ( context) =>  CreatePostPage(),


        // Role 3: Company
        '/companyRegFormScreen': (context) => const CompanyRegFormScreen(),
        '/companyHomeScreen': (context) => const CompanyRegFormScreen(),




        // Role 4: Mechanic
        '/mechanicRegFormScreen': (context) => const MechanicRegFormScreen(),
        '/mechanicHomeScreen': (context) => const MechanicHomeScreen(),

        // Role 5: Cooks
        '/cookRegFormScreen' : (context) => const CookRegFormScreen(),
        '/cookHomeScreen': (context) => const CookHomeScreen(),


        // Role 6: Fuel Provider
        '/fuelProviderRegFormScreen' : (context) => const FuelProviderRegFormScreen(),
        '/fuelProviderHomeScreen' : (context) => const FuelProviderHomeScreen(),








        // Add other routes as needed
      },
    );
  }
}