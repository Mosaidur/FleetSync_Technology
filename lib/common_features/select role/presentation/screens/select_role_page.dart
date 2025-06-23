import 'package:fleetsynctechnology/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String? selectedRole;

  final List<Map<String, dynamic>> roles = [
    {'label': 'Driver', 'icon': Icons.directions_car},
    {'label': 'Company', 'icon': Icons.business},
    {'label': 'Mechanics', 'icon': Icons.build},
    {'label': 'Fuel Provider', 'icon': Icons.local_gas_station},
    {'label': 'Cook', 'icon': Icons.restaurant},
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final borderColor = isDark ? Colors.white : Colors.black;
    final fontColor = isDark ? Colors.white : Colors.black;

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: fontColor,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemCount: roles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final role = roles[index];
                  final isSelected = selectedRole == role['label'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRole = role['label'];

                          // Logics are there

                        print(selectedRole);

                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.themeGreen
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.themeGreen
                              : borderColor.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            role['icon'],
                            color: isSelected
                                ? Colors.white
                                : borderColor.withOpacity(0.8),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            role['label'],
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? Colors.white : borderColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedRole == null
                    ? null
                    : () {
                  // Continue logic
                  print("Selected role: $selectedRole");

                  if (selectedRole == "Driver"){
                    //driver personal Info page
                    Navigator.pushNamed(context, '/driverPersonalInfo');
                  }else if(selectedRole == "Company" ){
                  Navigator.pushNamed(context, '/companyRegFormScreen');

                  }else if (selectedRole == "Mechanics" ){
                    Navigator.pushNamed(context, '/fuelProviderRegFormScreen');

                    // Navigator.pushNamed(context, '/mechanicRegFormScreen');
                  }else if (selectedRole == 'Fuel Provider' ){

                    Navigator.pushNamed(context, '/fuelProviderRegFormScreen');
                  }

                  // Navigator.pushNamed(context, '/selectRole');


                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
