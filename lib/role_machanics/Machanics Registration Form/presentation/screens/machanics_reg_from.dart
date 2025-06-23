import 'package:fleetsynctechnology/shared/widgets/custom_drop_down_field.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';

class MechanicRegFormScreen extends StatefulWidget {
  const MechanicRegFormScreen({super.key});

  @override
  State<MechanicRegFormScreen> createState() => _MechanicRegFormScreenState();
}

class _MechanicRegFormScreenState extends State<MechanicRegFormScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController repairTypesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController certificateUploadController = TextEditingController();

  String hasPhysicalShop = 'Yes';
  String offersMobileAssistance = 'Yes';

  final List<String> languageOptions = ['English', 'Spanish', 'Bengali'];

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
            const CustomText14(text: "Personal Information", color: AppColors.themeGreen, fontWeight: FontWeight.bold),
            const SizedBox(height: 16),
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
                      CustomTextField(controller: firstNameController, label: ''),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Last Name", color: textColor),
                      CustomTextField(controller: lastNameController, label: ''),
                    ],
                  ),
                ),
              ],
            ),
            CustomText14(text: "Shop Name", color: textColor),
            CustomTextField(controller: shopNameController, label: ''),
            CustomText14(text: "Types Of Repairs", color: textColor),
            CustomTextField(controller: repairTypesController, label: ''),
            CustomText14(text: "Do you have a physical repair shop?", color: textColor),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Yes',
                    groupValue: hasPhysicalShop,
                    onChanged: (val) => setState(() => hasPhysicalShop = val!),
                    title: Text('Yes', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'No',
                    groupValue: hasPhysicalShop,
                    onChanged: (val) => setState(() => hasPhysicalShop = val!),
                    title: Text('No', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
              ],
            ),
            CustomText14(text: "Do you offer mobile assistance?", color: textColor),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Yes',
                    groupValue: offersMobileAssistance,
                    onChanged: (val) => setState(() => offersMobileAssistance = val!),
                    title: Text('Yes', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'No',
                    groupValue: offersMobileAssistance,
                    onChanged: (val) => setState(() => offersMobileAssistance = val!),
                    title: Text('No', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
              ],
            ),
            CustomText14(text: "Address", color: textColor),
            CustomTextField(controller: addressController, label: ''),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "City", color: textColor),
                      CustomTextField(controller: cityController, label: ''),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "State", color: textColor),
                      CustomTextField(controller: stateController, label: ''),
                    ],
                  ),
                ),
              ],
            ),
            CustomText14(text: "E-mail", color: textColor),
            CustomTextField(controller: emailController, label: ''),
            CustomText14(text: "Phone", color: textColor),
            CustomTextField(controller: phoneController, label: ''),
            CustomText14(text: "Website", color: textColor),
            CustomTextField(controller: websiteController, label: ''),
            CustomText14(text: "Language Preferences", color: textColor),
            CustomDropdownField(
              // label: "Language Preferences",
              value: languageController.text.isEmpty ? null : languageController.text,
              items: languageOptions,
              onChanged: (value) {
                setState(() => languageController.text = value ?? '');
              },
            ),

            const SizedBox(height: 16),
            CustomText14(text: "Description", color: textColor),
            TextField(
              controller: descriptionController,
              minLines: 6,
              maxLines: 6,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            CustomText14(text: "Upload Your Certificate", color: textColor),
            TextField(
              controller: certificateUploadController,
              style: TextStyle(color: AppColors.themeGreen),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: Icon(Icons.upload_file, color: AppColors.themeGreen),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pop(context);

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text('Cancel'),
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
                    child: const Text('Next'),
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
