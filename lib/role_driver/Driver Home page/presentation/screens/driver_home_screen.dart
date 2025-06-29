import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/directory_list.dart';
import 'package:fleetsynctechnology/role_driver/Drawer/presentation/widgets/drawer.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/home_widget.dart';
import 'package:fleetsynctechnology/role_driver/Fuel%20Provider/presentation/widgets/fuel_provider_page.dart';
import 'package:fleetsynctechnology/role_driver/Map/presentation/widgets/map_main_page.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/widgets/truck_sales_widget.dart';
import 'package:fleetsynctechnology/role_driver/chat/presentation/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  int _selectedIndex = 0;

  // final List<String> routeNames = [
  //   '/driverHome',
  //   '/driverMap',
  //   '/driverChats',
  //   '/driverList',
  //   '/truckSales',
  //   '/fuelCard',
  // ];

  final List<Widget> _pages = [
    const HomeScreenWidget(), // Index 0
    const MapMainPage(), // Index 1

    const ChatPage(),// Index 2
    const DirectorListPage(), // Index 3
    const TruckSalesPage(), // Index 4
    const FuelProviderListPage(), // Index 5
  ];


  final List<IconData> icons = [
    Icons.house,
    Icons.place,
    Icons.email,
    Icons.contact_page,
    Icons.discount,
    Icons.credit_card,
  ];

  final List<String> labels = [
    'Home',
    'Map',
    'Chats',
    'List',
    'Truck Sales',
    'Fuel Card',
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    // Navigator.pushNamed(context, routeNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final iconDefaultColor = isDark ? Colors.white : Colors.black;
    final bottomContainerColor = isDark ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 32), // Replace with your logo
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: iconDefaultColor),
                children: const [
                  TextSpan(text: 'FleetSync ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\nTechnologies',style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          //   onPressed: () => themeProvider.toggleTheme(),
          // ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: iconDefaultColor),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
      endDrawer: CustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: iconDefaultColor.withOpacity(1),
                blurRadius: 10,
                offset: Offset(0, -2), // Shadow position (above the navbar)
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedFontSize: 10,
            unselectedFontSize: 10,
            currentIndex: _selectedIndex,
            backgroundColor: bottomContainerColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.themeGreen,
            unselectedItemColor: iconDefaultColor,
            onTap: _onItemTapped,
            items: List.generate(6, (index) {
              return BottomNavigationBarItem(
                icon: Icon(icons[index]),
                label: labels[index],
              );
            }),
          ),
        ),
      ),

    );
  }
}
