import 'package:fleetsynctechnology/shared/widgets/custom_drop_down_field.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';


class CookRegFormScreen extends StatefulWidget {
  const CookRegFormScreen({super.key});

  @override
  State<CookRegFormScreen> createState() => _CookRegFormScreenState();
}

class _CookRegFormScreenState extends State<CookRegFormScreen> {
  final firstNameController = TextEditingController();
  final foodServiceNameController = TextEditingController();
  final cuisineTypeController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final TextEditingController certificateUploadController = TextEditingController();
  final List<String> languageOptions = ['English', 'Spanish', 'French'];
  String? selectedLanguage;
  String fixedLocation = 'Yes';
  String mobileService = 'Yes';

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
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
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText14(text: "Personal Information", color: AppColors.themeGreen, fontWeight: FontWeight.bold),
            const CustomText14(text: "Upload Photo", color: Colors.grey),
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 40),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "First Name", color: textColor),
                      CustomTextField(controller: firstNameController),
                    ],
                  ),
                ),
              ],
            ),
            CustomText14(text: "Food Service Name", color: textColor),
            CustomTextField(controller: foodServiceNameController),
            CustomText14(text: "Types Of Cuisines", color: textColor),
            CustomTextField(controller: cuisineTypeController),
            CustomText14(text: "Do you sell food from a fixed location?", color: textColor),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Yes',
                    groupValue: fixedLocation,
                    onChanged: (val) => setState(() => fixedLocation = val!),
                    title: Text('Yes', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'No',
                    groupValue: fixedLocation,
                    onChanged: (val) => setState(() => fixedLocation = val!),
                    title: Text('No', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
              ],
            ),
            CustomText14(text: "Do you offer mobile delivery or roadside service?", color: textColor),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Yes',
                    groupValue: mobileService,
                    onChanged: (val) => setState(() => mobileService = val!),
                    title: Text('Yes', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'No',
                    groupValue: mobileService,
                    onChanged: (val) => setState(() => mobileService = val!),
                    title: Text('No', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
              ],
            ),
            CustomText14(text: "Address (If any)", color: textColor),
            CustomTextField(controller: addressController),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "City", color: textColor),
                      CustomTextField(controller: cityController),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "State", color: textColor),
                      CustomTextField(controller: stateController),
                    ],
                  ),
                ),
              ],
            ),
            CustomText14(text: "E-mail", color: textColor),
            CustomTextField(controller: emailController),
            CustomText14(text: "Phone", color: textColor),
            CustomTextField(controller: phoneController),
            CustomText14(text: "Website", color: textColor),
            CustomTextField(controller: websiteController),
            CustomText14(text: "Language Preferences", color: textColor),
            CustomDropdownField(
              items: languageOptions,
              value: selectedLanguage,
              label: "Select Language",
              onChanged: (val) => setState(() => selectedLanguage = val),
            ),
            CustomText14(text: "Description", color: textColor),
            TextField(
              controller: descriptionController,
              maxLines: 6,
              minLines: 6,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            CustomText14(text: "Upload Your Certificate", color: textColor),
            TextField(
              controller: certificateUploadController,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: textColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: textColor, width: 2),
                ),
                suffixIcon: Icon(Icons.upload_file, color: AppColors.themeGreen),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text("Next"),
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
