import 'dart:io';

import 'package:fleetsynctechnology/shared/widgets/custom_drop_down_field.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';


class FuelProviderRegFormScreen extends StatefulWidget {
  const FuelProviderRegFormScreen({super.key});

  @override
  State<FuelProviderRegFormScreen> createState() => _FuelProviderRegFormScreenState();
}

class _FuelProviderRegFormScreenState extends State<FuelProviderRegFormScreen> {
  final fuelCardController = TextEditingController();
  final fuelCompanyController = TextEditingController();
  final truckStopsController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final discountController = TextEditingController();
  final descriptionController = TextEditingController();

  final List<String> languageOptions = ['English', 'Spanish', 'French'];
  String? selectedLanguage;
  String creditAvailability = 'Yes';

  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImageFromSource(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImageFromSource(ImageSource.camera);
            },
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImageFromSource(ImageSource.gallery);
            },
            child: const Text('Gallery'),
          ),
        ],
      ),
    );
  }

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
              child: GestureDetector(
                onTap: _showImageSourceDialog, // or _pickImageFromSource(ImageSource.gallery)
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
                  child: _pickedImage == null ? Icon(Icons.person, size: 40, color: textColor ,) : null,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomText14(text: "Fuel Card Name", color: textColor),
            CustomTextField(controller: fuelCardController),
            CustomText14(text: "Fuel Company Name", color: textColor),
            CustomTextField(controller: fuelCompanyController),
            CustomText14(text: "Supported Truck Stops", color: textColor),
            CustomTextField(controller: truckStopsController),
            CustomText14(text: "Address", color: textColor),
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
            CustomText14(text: "Average Weekly Discount", color: textColor),
            CustomTextField(controller: discountController),
            CustomText14(text: "Credit Line Availability", color: textColor),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Yes',
                    groupValue: creditAvailability,
                    onChanged: (val) => setState(() => creditAvailability = val!),
                    title: Text('Yes', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'No',
                    groupValue: creditAvailability,
                    onChanged: (val) => setState(() => creditAvailability = val!),
                    title: Text('No', style: TextStyle(color: textColor)),
                    activeColor: AppColors.themeGreen,
                  ),
                ),
              ],
            ),
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
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pushNamed(context, '/getYourPackageScreen');


                    },
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
