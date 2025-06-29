import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController experienceYearController = TextEditingController();
  final TextEditingController experienceMonthController = TextEditingController();
  final TextEditingController violationController = TextEditingController();
  final TextEditingController previousCompanyController = TextEditingController();
  final TextEditingController cdlTypeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController truckBrandController = TextEditingController();
  final TextEditingController truckModelController = TextEditingController();
  final TextEditingController manufactureYearController = TextEditingController();
  final TextEditingController engineTypeController = TextEditingController();
  final TextEditingController transmissionTypeController = TextEditingController();
  final TextEditingController axelsController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController truckDescriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  String driverType = 'Company Driver';
  String trailerOwnership = 'Yes';
  String tEndorsement = 'Yes';
  bool agreeTerms = false;

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dobController.dispose();
    addressController.dispose();
    languageController.dispose();
    experienceYearController.dispose();
    experienceMonthController.dispose();
    violationController.dispose();
    previousCompanyController.dispose();
    cdlTypeController.dispose();
    descriptionController.dispose();
    truckBrandController.dispose();
    truckModelController.dispose();
    manufactureYearController.dispose();
    engineTypeController.dispose();
    transmissionTypeController.dispose();
    axelsController.dispose();
    conditionController.dispose();
    truckDescriptionController.dispose();
    super.dispose();
  }

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

  // Save form data locally using shared_preferences
  Future<void> _saveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'fullName': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'gender': genderController.text.trim(),
      'dob': dobController.text.trim(),
      'address': addressController.text.trim(),
      'language': languageController.text.trim(),
      'experienceYears': experienceYearController.text.trim(),
      'experienceMonths': experienceMonthController.text.trim(),
      'violations': violationController.text.trim(),
      'previousCompany': previousCompanyController.text.trim(),
      'cdlTypes': cdlTypeController.text.trim(),
      'tEndorsement': tEndorsement,
      'driverType': driverType,
      'trailerOwnership': trailerOwnership,
      'description': descriptionController.text.trim(),
      'truckBrand': truckBrandController.text.trim(),
      'truckModel': truckModelController.text.trim(),
      'manufactureYear': manufactureYearController.text.trim(),
      'engineType': engineTypeController.text.trim(),
      'transmissionType': transmissionTypeController.text.trim(),
      'axels': axelsController.text.trim(),
      'condition': conditionController.text.trim(),
      'truckDescription': truckDescriptionController.text.trim(),
      'imagePath': _pickedImage?.path ?? '',
    };
    await prefs.setString('profileData', jsonEncode(data));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile data saved locally')),
    );
  }

  // Load form data from local storage
  Future<void> _loadDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final dataString = prefs.getString('profileData');
    if (dataString != null) {
      final data = jsonDecode(dataString);
      setState(() {
        nameController.text = data['fullName'] ?? '';
        phoneController.text = data['phone'] ?? '';
        genderController.text = data['gender'] ?? '';
        dobController.text = data['dob'] ?? '';
        addressController.text = data['address'] ?? '';
        languageController.text = data['language'] ?? '';
        experienceYearController.text = data['experienceYears'] ?? '';
        experienceMonthController.text = data['experienceMonths'] ?? '';
        violationController.text = data['violations'] ?? '';
        previousCompanyController.text = data['previousCompany'] ?? '';
        cdlTypeController.text = data['cdlTypes'] ?? '';
        tEndorsement = data['tEndorsement'] ?? 'Yes';
        driverType = data['driverType'] ?? 'Company Driver';
        trailerOwnership = data['trailerOwnership'] ?? 'Yes';
        descriptionController.text = data['description'] ?? '';
        truckBrandController.text = data['truckBrand'] ?? '';
        truckModelController.text = data['truckModel'] ?? '';
        manufactureYearController.text = data['manufactureYear'] ?? '';
        engineTypeController.text = data['engineType'] ?? '';
        transmissionTypeController.text = data['transmissionType'] ?? '';
        axelsController.text = data['axels'] ?? '';
        conditionController.text = data['condition'] ?? '';
        truckDescriptionController.text = data['truckDescription'] ?? '';
        if (data['imagePath'] != '') {
          _pickedImage = File(data['imagePath']);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDataLocally(); // Load saved data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: AppColors.themeGreen)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: DefaultTextStyle(
          style: TextStyle(color: textColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                "Personal Information",
                style: TextStyle(
                  color: AppColors.themeGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              CustomText14(text: "Upload Photo", color: textColor),
              const SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: _showImageSourceDialog,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
                    child: _pickedImage == null
                        ? Icon(Icons.person, size: 40, color: textColor)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomText14(text: "Full Name", color: textColor),
              CustomTextField(controller: nameController),
              const SizedBox(height: 16),
              CustomText14(text: "Phone Number", color: textColor),
              CustomTextField(controller: phoneController),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText14(text: "Gender", color: textColor),
                        CustomTextField(controller: genderController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText14(text: "Date of Birth", color: textColor),
                        CustomTextField(controller: dobController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomText14(text: "Address", color: textColor),
              CustomTextField(controller: addressController),
              const SizedBox(height: 16),
              CustomText14(text: "Language Preferences", color: textColor),
              CustomTextField(controller: languageController),
              const SizedBox(height: 24),
              Text(
                "Professional Information",
                style: TextStyle(
                  color: AppColors.themeGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              CustomText14(text: "Driver or owner operator?", color: textColor),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Owner Operator',
                      groupValue: driverType,
                      onChanged: (val) => setState(() => driverType = val!),
                      title: CustomText14(text: 'Owner Operator', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Company Driver',
                      groupValue: driverType,
                      onChanged: (val) => setState(() => driverType = val!),
                      title: CustomText14(text: 'Company Driver', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                ],
              ),
              CustomText14(text: "Own a trailer?", color: textColor),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Yes',
                      groupValue: trailerOwnership,
                      onChanged: (val) => setState(() => trailerOwnership = val!),
                      title: CustomText14(text: 'Yes', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'No',
                      groupValue: trailerOwnership,
                      onChanged: (val) => setState(() => trailerOwnership = val!),
                      title: CustomText14(text: 'No', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                ],
              ),
              CustomText14(text: "Work Experience", color: textColor),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText14(text: "Years", color: textColor),
                        CustomTextField(controller: experienceYearController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText14(text: "Months", color: textColor),
                        CustomTextField(controller: experienceMonthController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomText14(text: "Accidents or violations (last 2 years)", color: textColor),
              CustomTextField(controller: violationController),
              const SizedBox(height: 16),
              CustomText14(text: "Previous Company", color: textColor),
              CustomTextField(controller: previousCompanyController),
              const SizedBox(height: 16),
              CustomText14(text: "CDL Types", color: textColor),
              CustomTextField(controller: cdlTypeController),
              const SizedBox(height: 16),
              CustomText14(text: "T Endorsement", color: textColor),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'Yes',
                      groupValue: tEndorsement,
                      onChanged: (val) => setState(() => tEndorsement = val!),
                      title: CustomText14(text: 'Yes', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'No',
                      groupValue: tEndorsement,
                      onChanged: (val) => setState(() => tEndorsement = val!),
                      title: CustomText14(text: 'No', color: textColor),
                      activeColor: AppColors.themeGreen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
              Text(
                "Truck Information",
                style: TextStyle(
                  color: AppColors.themeGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
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
              CustomText14(text: "Condition", color: textColor),
              CustomTextField(controller: conditionController, label: ''),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: agreeTerms,
                    activeColor: AppColors.themeGreen,
                    onChanged: (value) => setState(() => agreeTerms = value ?? false),
                  ),
                  Expanded(
                    child: CustomText14(
                      text: 'I agree to FleetSync’s Terms and Conditions and Privacy Policy.',
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate form
                    // if (nameController.text.trim().isEmpty ||
                    //     phoneController.text.trim().isEmpty ||
                    //     genderController.text.trim().isEmpty ||
                    //     dobController.text.trim().isEmpty ||
                    //     addressController.text.trim().isEmpty ||
                    //     languageController.text.trim().isEmpty ||
                    //     experienceYearController.text.trim().isEmpty ||
                    //     experienceMonthController.text.trim().isEmpty ||
                    //     violationController.text.trim().isEmpty ||
                    //     previousCompanyController.text.trim().isEmpty ||
                    //     cdlTypeController.text.trim().isEmpty ||
                    //     descriptionController.text.trim().isEmpty ||
                    //     !agreeTerms) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text("Please fill all fields and agree to the terms")),
                    //   );
                    //   return;
                    // }
                    //
                    // // Save data locally
                    // await _saveDataLocally();

                    // Print values for debugging
                    print("Full Name: ${nameController.text.trim()}");
                    print("Phone: ${phoneController.text.trim()}");
                    print("Gender: ${genderController.text.trim()}");
                    print("DOB: ${dobController.text.trim()}");
                    print("Address: ${addressController.text.trim()}");
                    print("Language: ${languageController.text.trim()}");
                    print("Experience: ${experienceYearController.text.trim()}y ${experienceMonthController.text.trim()}m");
                    print("Violations: ${violationController.text.trim()}");
                    print("Previous Company: ${previousCompanyController.text.trim()}");
                    print("CDL Types: ${cdlTypeController.text.trim()}");
                    print("T Endorsement: $tEndorsement");
                    print("Driver Type: $driverType");
                    print("Trailer Ownership: $trailerOwnership");
                    print("Description: ${descriptionController.text.trim()}");
                    print("Truck Brand: ${truckBrandController.text.trim()}");
                    print("Truck Model: ${truckModelController.text.trim()}");
                    print("Manufacture Year: ${manufactureYearController.text.trim()}");
                    print("Engine Type: ${engineTypeController.text.trim()}");
                    print("Transmission Type: ${transmissionTypeController.text.trim()}");
                    print("Axels: ${axelsController.text.trim()}");
                    print("Condition: ${conditionController.text.trim()}");
                    print("Truck Description: ${truckDescriptionController.text.trim()}");

                    // Navigate based on saved role
                    final prefs = await SharedPreferences.getInstance();
                    final role = prefs.getString('role')?.toLowerCase() ?? '';
                    String route = '/'; // fallback
                    switch (role) {
                      case 'driver':
                        route = '/driverHome';
                        break;
                      case 'company':
                        route = '/companyHomeScreen';
                        break;
                      case 'mechanics':
                        route = '/mechanicHomeScreen';
                        break;
                      case 'fuel provider':
                        route = '/fuelProviderHomeScreen';
                        break;
                      case 'cook':
                        route = '/cookHomeScreen';
                        break;
                    }
                    Navigator.pushNamed(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text('Save & Change'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}