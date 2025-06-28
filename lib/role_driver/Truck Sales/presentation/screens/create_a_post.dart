import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';

class CreatePostPage extends StatefulWidget {
  CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final brandNameController = TextEditingController();

  final modelNameController = TextEditingController();

  final manufactureYearController = TextEditingController();

  final mileageController = TextEditingController();

  final transmissionTypeController = TextEditingController();

  final engineTypeController = TextEditingController();

  final axelsController = TextEditingController();

  final priceController = TextEditingController();

  final conditionController = TextEditingController();

  final locationController = TextEditingController();

  final onBehalfOfController = TextEditingController();

  final descriptionsController = TextEditingController();

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
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF121212) : Colors.white;
    final borderColor = isDark ? Colors.white54 : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Registration", style: TextStyle(color: AppColors.themeGreen)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText14(text: "Brand", color: textColor),
            CustomTextField(controller: brandNameController),
            const SizedBox(height: 16),

            CustomText14(text: "Model", color: textColor),
            CustomTextField(controller: modelNameController),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Manufacture Year", color: textColor),
                      CustomTextField(controller: manufactureYearController),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Mileage", color: textColor),
                      CustomTextField(controller: mileageController),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Transmission Type", color: textColor),
                      CustomTextField(controller: transmissionTypeController),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Engine Type", color: textColor),
                      CustomTextField(controller: engineTypeController),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Axels", color: textColor),
                      CustomTextField(controller: axelsController),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText14(text: "Price", color: textColor),
                      CustomTextField(controller: priceController),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            CustomText14(text: "Condition", color: textColor),
            CustomTextField(controller: conditionController),
            const SizedBox(height: 16),

            CustomText14(text: "Location", color: textColor),
            CustomTextField(controller: locationController),
            const SizedBox(height: 16),

            CustomText14(text: "On behalf of", color: textColor),
            CustomTextField(controller: onBehalfOfController),
            const SizedBox(height: 16),

            CustomText14(text: "Descriptions", color: textColor),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionsController,
              maxLines: 6,
              minLines: 6,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Write something...",
                hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            CustomText14(text: "Add Image", color: textColor),
            const SizedBox(height: 12),

            Column(
              children: [
                GestureDetector(
                  onTap: _showImageSourceDialog, // Correctly used with method reference
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor, style: BorderStyle.solid, width: 1.5),
                        color: Colors.transparent,
                      ),
                      child: _pickedImage != null
                          ? ClipOval(
                        child: Image.file(
                          _pickedImage!,
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      )
                          : Icon(Icons.image_outlined, size: 40, color: textColor),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _showImageSourceDialog, // Correct usage
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor, style: BorderStyle.solid, width: 1.5),
                        color: Colors.transparent,
                      ),
                      child: const Center(
                        child: Text("Add Image", textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Post Submission

                  Navigator.pushNamed(context, '/driverHome');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("Post Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
