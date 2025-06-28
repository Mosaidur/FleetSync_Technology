import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/screens/truck_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/role_driver/Driver Home page/presentation/widgets/truck_info_card.dart';

class TruckSalesSection extends StatelessWidget {
  final List<Map<String, dynamic>> truckList;
  final VoidCallback? onSeeAllTap;

  const TruckSalesSection({
    super.key,
    required this.truckList,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row with "See all"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Truck Sales',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              GestureDetector(
                onTap: onSeeAllTap ?? () => debugPrint("See all tapped"),
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.grey : AppColors.themeGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280, // Control the visible height
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: truckList.map((truck) {
                // Debug prints to verify data
                // debugPrint('Truck Data: $truck');
                // debugPrint('imageUrl: ${truck['imageUrl']}');
                // debugPrint('truckCompanyName: ${truck['truckCompanyName']}');
                // debugPrint('additionalImages: ${truck['additionalImages']}');

                // Safely convert additionalImages to List<String>
                List<String> additionalImages = [];
                if (truck['additionalImages'] is List) {
                  try {
                    additionalImages = List<String>.from(truck['additionalImages']);
                  } catch (e) {
                    debugPrint('Error casting additionalImages: $e');
                    additionalImages = [];
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 5,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: TruckSaleCard(
                        imageUrl: truck['imageUrl'] ?? '',
                        truckModelName: truck['modelName'] ?? '',
                        location: truck['location'] ?? '',
                        info: truck['brandName'] ?? '',
                        onSaveTap: () => debugPrint('Saved: ${truck['model']}'),
                        onShareTap: () => debugPrint('Shared: ${truck['model']}'),
                        onViewTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TruckDetailsScreen(
                                imageUrl: truck['imageUrl'] ?? '',
                                additionalImages: additionalImages,
                                truckCompanyName: truck['truckCompanyName'] ?? '',
                                location: truck['location'] ?? '',
                                shortDescription: truck['shortDescription'] ?? '',
                                price: truck['price'] ?? '',
                                modelName: truck['modelName'] ?? '',
                                brandName: truck['brandName'] ?? '',
                                manufactureYear: truck['manufactureYear'] ?? '',
                                mileage: truck['mileage'] ?? '',
                                transmissionType: truck['transmissionType'] ?? '',
                                engineType: truck['engineType'] ?? '',
                                condition: truck['condition'] ?? '',
                                axells: truck['axells'] ?? '',
                                ownerName: truck['ownerName'] ?? '',
                                ownerImageUrl: truck['ownerImageUrl'] ?? '',
                                fullDescription: truck['fullDescription'] ?? '',
                                createPost: false,
                                onSendRequest: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Request Sent")),
                                  );
                                },
                                onDeletePost: () {
                                  debugPrint("Deleted the post");
                                },
                                onSaveAndChange: () {
                                  debugPrint("Save And Change");
                                },
                              ),
                            ),
                          );

                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
