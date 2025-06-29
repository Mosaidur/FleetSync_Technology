import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class ResetPasswordOtpScreen extends StatefulWidget {
  const ResetPasswordOtpScreen({super.key});

  @override
  State<ResetPasswordOtpScreen> createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen> {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void onOtpChanged(int index, String value) {
    if (value.length == 1) {
      // Move focus to next field if exists
      if (index < otpControllers.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
      }
    }
    if (value.isEmpty && index > 0) {
      // If user deleted, move focus back
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  String getOtpCode() {
    return otpControllers.map((c) => c.text).join();
  }



  void validateAndSubmitOtp(BuildContext context) {
    final otp = getOtpCode().trim();

    if (otp.length != 6 || !RegExp(r'^\d{6}$').hasMatch(otp)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Incorrect OTP. Please enter a valid 6-digit code."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    print("Entered OTP: $otp");

    // Proceed to the reset password screen
    Navigator.pushNamed(context, '/resetPass');
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final borderColor = isDark ? Colors.grey : Colors.black26;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      //       onPressed: () => themeProvider.toggleTheme(),
      //       color: isDark ? Colors.white : Colors.black,
      //     )
      //   ],
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.themeGreen : AppColors.themeGreen,
                  ),
                ),
              ),
              const SizedBox(height: 16),
        
              Center(
                child: Text(
                  "Provide your email address to change \npassword.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
              ),
              const SizedBox(height: 30),
        
              Text(
                "Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
        
        
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    height: 55,
                    child: TextField(
                      controller: otpControllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) => onOtpChanged(index, value),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40),
        
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => validateAndSubmitOtp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        
        
              const SizedBox(height: 24),
        
        
        
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       print("Resend Code tapped");
              //       // Add resend OTP logic here
              //     },
              //     child: Text(
              //       "Resend Code",
              //       style: TextStyle(
              //         color: AppColors.themeRed,
              //         fontWeight: FontWeight.bold,
              //         decoration: TextDecoration.underline,
              //         decorationColor: AppColors.themeRed,
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
        
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
