import 'dart:io';

import 'package:fleetsynctechnology/shared/widgets/custom_drop_down_field.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';

class CompanyRegFormScreen extends StatefulWidget {
  const CompanyRegFormScreen({super.key});

  @override
  State<CompanyRegFormScreen> createState() => _CompanyRegFormScreenState();
}

class _CompanyRegFormScreenState extends State<CompanyRegFormScreen> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController dotNumberController = TextEditingController();
  final TextEditingController mcNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController transportationTypeController = TextEditingController();
  final TextEditingController languagePreferenceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> transportOptions = ['Dry Van', 'Flatbed', 'Reefer', 'Tanker'];
  final List<String> languageOptions = ['English', 'Spanish', 'Bengali'];

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
              text: "Personal Information",
              color: AppColors.themeGreen,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),

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

            CustomText14(text: "Company Name", color: textColor),
            CustomTextField(controller: companyNameController, label: ''),

            CustomText14(text: "DOT Number", color: textColor),
            CustomTextField(controller: dotNumberController, label: ''),

            CustomText14(text: "MC Number", color: textColor),
            CustomTextField(controller: mcNumberController, label: ''),

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

            CustomText14(text: "Transportation Type", color: textColor),
            CustomDropdownField(
              // label: "Transportation Type",
              value: transportationTypeController.text.isEmpty ? null : transportationTypeController.text,
              items: transportOptions,
              onChanged: (value) {
                setState(() {
                  transportationTypeController.text = value ?? '';
                });
              },
            ),

            const SizedBox(height: 16),
            CustomText14(text: "Language Preferences", color: textColor),
            CustomDropdownField(
              // label: "Language Preferences",
              value: languagePreferenceController.text.isEmpty ? null : languagePreferenceController.text,
              items: languageOptions,
              onChanged: (value) {
                setState(() {
                  languagePreferenceController.text = value ?? '';
                });
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

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Cancel logic here
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
                    onPressed: () {
                      // Next logic here

                      Navigator.pushNamed(context, '/getYourPackageScreen');



                    },
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
