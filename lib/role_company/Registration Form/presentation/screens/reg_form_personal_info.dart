import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/shared/widgets/customTextField.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/custom_text_14.dart';

class DriverRegPersonalInfoScreen extends StatefulWidget {
  const DriverRegPersonalInfoScreen({super.key});

  @override
  State<DriverRegPersonalInfoScreen> createState() => _DriverRegPersonalInfoScreenState();
}

class _DriverRegPersonalInfoScreenState extends State<DriverRegPersonalInfoScreen> {
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

  String driverType = 'Company Driver';
  String trailerOwnership = 'Yes';
  String tEndorsement = 'Yes';
  bool agreeTerms = false;

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
        child: DefaultTextStyle(
          style: TextStyle(color: textColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomText14(text: "Personal Information", color: AppColors.themeGreen, fontWeight: FontWeight.bold),
              const SizedBox(height: 16),
              CustomText14(text: "Upload Photo", color: textColor),
              const SizedBox(height: 8),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 40),
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
              CustomText14(text: "Professional Information", color: AppColors.themeGreen, fontWeight: FontWeight.bold),
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
                      onPressed: ()  {
                        // Collect all field values
                        final fullName = nameController.text.trim();
                        final phone = phoneController.text.trim();
                        final gender = genderController.text.trim();
                        final dob = dobController.text.trim();
                        final address = addressController.text.trim();
                        final language = languageController.text.trim();
                        final expYears = experienceYearController.text.trim();
                        final expMonths = experienceMonthController.text.trim();
                        final violations = violationController.text.trim();
                        final prevCompany = previousCompanyController.text.trim();
                        final cdlTypes = cdlTypeController.text.trim();
                        final description = descriptionController.text.trim();

                        // Check if any field is empty
                        // if (fullName.isEmpty ||
                        //     phone.isEmpty ||
                        //     gender.isEmpty ||
                        //     dob.isEmpty ||
                        //     address.isEmpty ||
                        //     language.isEmpty ||
                        //     expYears.isEmpty ||
                        //     expMonths.isEmpty ||
                        //     violations.isEmpty ||
                        //     prevCompany.isEmpty ||
                        //     cdlTypes.isEmpty ||
                        //     description.isEmpty ||
                        //     !agreeTerms) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text("Please fill all fields and agree to the terms")),
                        //   );
                        //   return;
                        // }

                        // Print all values
                        print("Full Name: $fullName");
                        print("Phone: $phone");
                        print("Gender: $gender");
                        print("DOB: $dob");
                        print("Address: $address");
                        print("Language: $language");
                        print("Experience: ${expYears}y ${expMonths}m");
                        print("Violations: $violations");
                        print("Previous Company: $prevCompany");
                        print("CDL Types: $cdlTypes");
                        print("T Endorsement: $tEndorsement");
                        print("Driver Type: $driverType");
                        print("Trailer Ownership: $trailerOwnership");
                        print("Description: $description");

                        // Proceed to next screen or logic
                        // Navigator.pushNamed(context, '/driverVehicleInfo');
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
      ),
    );
  }
}
