import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';

class DriverVehicleInfoScreen extends StatefulWidget {
  const DriverVehicleInfoScreen({super.key});

  @override
  State<DriverVehicleInfoScreen> createState() => _DriverVehicleInfoScreenState();
}

class _DriverVehicleInfoScreenState extends State<DriverVehicleInfoScreen> {
  final TextEditingController truckBrandController = TextEditingController();
  final TextEditingController truckModelController = TextEditingController();
  final TextEditingController manufactureYearController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController transmissionTypeController = TextEditingController();
  final TextEditingController axelsController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController truckDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration", style: TextStyle(color: AppColors.themeGreen)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText14(
              text: "Truck Information",
              color: AppColors.themeGreen,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),

            /// Truck Brand & Model
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Truck Brand", color: textColor),
                      CustomTextField(controller: truckBrandController, label: ''),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Truck Model", color: textColor),
                      CustomTextField(controller: truckModelController, label: ''),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Manufacture Year & Engine Type
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Manufacture Year", color: textColor),
                      CustomTextField(controller: manufactureYearController, label: ''),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Engine Type", color: textColor),
                      CustomTextField(controller: engineTypeController, label: ''),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Transmission Type & Axels
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Transmission Type", color: textColor),
                      CustomTextField(controller: transmissionTypeController, label: ''),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Axels", color: textColor),
                      CustomTextField(controller: axelsController, label: ''),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Condition
            CustomText14(text: "Condition", color: textColor),
            CustomTextField(controller: conditionController, label: ''),
            const SizedBox(height: 16),

            /// Truck Description
            CustomText14(text: "Truck Description", color: textColor),
            TextField(
              controller: truckDescriptionController,
              minLines: 6,
              maxLines: 6,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(height: 24),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Skip logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeYellow,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text("Skip"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Done logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text("Done"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
