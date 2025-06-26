import 'package:fleetsynctechnology/shared/widgets/verification_waring.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class CompanyDetailsPage extends StatelessWidget {
  final String coverImageUrl;
  final String companyName;
  final String location;
  final String rating;
  final String totalReviews;
  final String totalTruck;
  final String totalEmployee;
  final String experience;
  final String officeHour;
  final String time;
  final String description;

  const CompanyDetailsPage({
    super.key,
    required this.coverImageUrl,
    required this.companyName,
    required this.location,
    required this.rating,
    required this.totalReviews,
    required this.totalTruck,
    required this.totalEmployee,
    required this.experience,
    required this.officeHour,
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    final double parsedRating = double.tryParse(rating) ?? 0.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Company Details", style: TextStyle(color: AppColors.themeGreen)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                DynamicImage(imageUrl: coverImageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: backgroundColor,
                        child: IconButton(
                          icon: const Icon(Icons.bookmark_border, color: AppColors.themeGreen),
                          onPressed: () {


                            print("Save from Company Details");
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      CircleAvatar(
                        backgroundColor: backgroundColor,
                        child: IconButton(
                          icon: const Icon(Icons.share, color: AppColors.themeGreen),
                          onPressed: () {
                            // share link logic

                            print("Share from Company Details");
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(companyName, style: const TextStyle(color: AppColors.themeGreen, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location, style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (starIndex) {
                          final color = starIndex < parsedRating.floor() ? Colors.yellow : Colors.grey;
                          return Icon(Icons.star, color: color, size: 16);
                        }),
                      ),
                      const SizedBox(width: 6),
                      Text(rating, style: const TextStyle(color: AppColors.themeGreen, fontSize: 12)),
                      const SizedBox(width: 4),
                      Text('($totalReviews Reviews)', style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.7))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard("$totalTruck+", "Total Truck"),
                      _buildStatCard("$experience years", "Experience"),
                      _buildStatCard("$totalEmployee+", "Total Employee"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Office Hours", style: TextStyle(fontSize: 16, color: textColor , fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(officeHour + time, style: const TextStyle(color: AppColors.themeGreen, fontSize: 14)),
                  const SizedBox(height: 12),
                  // const Text("Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.8)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                        print(" Send Request ");

                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: true,
                        //   builder: (_) => const Dialog(
                        //     backgroundColor: Colors.transparent,
                        //     insetPadding: EdgeInsets.symmetric(horizontal: 16),
                        //     child: VerificationPopup(verified: false), // Set to true or false
                        //   ),
                        // );


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Send Request"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String subtitle) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x1A00A430),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: AppColors.themeGreen, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
