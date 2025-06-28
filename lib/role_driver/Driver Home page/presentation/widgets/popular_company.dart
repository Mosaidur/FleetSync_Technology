import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/company_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'popular_company_card.dart';

class PopularCompaniesSection extends StatelessWidget {
  final List<Map<String, String>> companyList;

  const PopularCompaniesSection({super.key, required this.companyList});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Companies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle 'See All'
                  print("See all");
                },
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
        const SizedBox(height: 8),

        // Horizontal Scroll List
        SizedBox(
          // height: 280,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: companyList.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2)-5,
                    child: PopularCompanyCard(
                      imageUrl: item['coverImageUrl'] ?? item['imageUrl'] ?? '',
                      companyName: item['companyName'] ?? item['name'] ?? '',
                      location: item['location'] ?? '',
                      rating: item['rating'].toString(),
                      onSaveTap: () {
                        debugPrint('Saved ${item['companyName']}');
                      },
                      onViewTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CompanyDetailsPage(
                              coverImageUrl: item['coverImageUrl'] ?? '',
                              companyName: item['companyName'] ?? '',
                              location: item['location'] ?? '',
                              rating: item['rating'].toString(),
                              totalReviews: item['totalReviews'].toString(),
                              totalTruck: item['totalTruck'].toString(),
                              totalEmployee: item['totalEmployee'].toString(),
                              experience: item['experience'].toString(),
                              officeHour: item['officeHour'] ?? '',
                              time: item['time'] ?? '',
                              description: item['description'] ?? '',
                            ),
                          ),
                        );
                      },
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
