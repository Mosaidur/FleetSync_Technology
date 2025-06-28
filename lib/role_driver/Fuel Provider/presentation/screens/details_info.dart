import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/company_details.dart';
import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/directory_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';

class CardDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String companyName;
  final String shortDescription;
  final String rating;
  final String totalReviews;
  final String cardType;
  final String acceptedStations;
  final String discounts;
  final String creditLine;
  final String cardCompanyName;
  final String location;
  final String fullDescription;

  const CardDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.companyName,
    required this.shortDescription,
    required this.rating,
    required this.totalReviews,
    required this.cardType,
    required this.acceptedStations,
    required this.discounts,
    required this.creditLine,
    required this.cardCompanyName,
    required this.location,
    required this.fullDescription,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final double intRating = double.tryParse(rating) ?? 0.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title:Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: const Text(
            "Card Details",
            style: TextStyle(color: AppColors.themeGreen),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DynamicImage(imageUrl: imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),

            Text(
              companyName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.themeGreen,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              shortDescription,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.8)),
            ),

            const SizedBox(height: 12),

            // Rating Row
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    final color = index < intRating.floor() ? Colors.yellow : Colors.grey;
                    return Icon(Icons.star, size: 18, color: color);
                  }),
                ),
                const SizedBox(width: 8),
                Text(
                  '$rating',
                  style: const TextStyle(color: AppColors.themeGreen),
                ),
                const SizedBox(width: 4),
                Text('($totalReviews Reviews)', style: TextStyle(color: textColor.withOpacity(0.7))),
              ],
            ),
            const SizedBox(height: 16),

            _buildInfoRow(context, "Card Type", cardType),
            _buildInfoRow(context, "Accepted Fuel Stations", acceptedStations),
            _buildInfoRow(context, "Discounts & Offers: ", discounts),
            _buildInfoRow(context, "Credit Line", creditLine),
            _buildInfoRow(context, "Card Company Name", cardCompanyName),
            _buildInfoRow(context, "Location", location),

            const SizedBox(height: 7),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                fullDescription,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12, color: textColor),

              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Send Request clicked');


                  Navigator.pushNamed(context, '/driverHome');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeGreen,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text('Send Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$label: ",
                style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      color: AppColors.themeGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
