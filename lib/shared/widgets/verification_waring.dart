import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart'; // Update path based on your project

class VerificationPopup extends StatelessWidget {
  final bool verified;

  const VerificationPopup({super.key, required this.verified});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark ? Colors.black : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black;
    final Color alertColor = verified ? AppColors.themeGreen : AppColors.themeRed;

    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: verified ? AppColors.themeGreen : AppColors.themeRed,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.warning_rounded, size: 60, color: Colors.black),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              verified
                                  ? "This account \nis verified"
                                  : "This account \nis not verified",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (!verified)
                        Text(
                          "FleetSync takes no responsibility for any service outcomes resulting from unverified accounts.",
                          style: TextStyle(
                            color: textColor.withOpacity(0.8),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 25,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.close, color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
