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

        // Two cards per screen in horizontal scroll
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: (companyList.length / 2).ceil(),
            itemBuilder: (context, index) {
              final first = companyList[index * 2];
              final second = (index * 2 + 1 < companyList.length)
                  ? companyList[index * 2 + 1]
                  : null;

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: PopularCompanyCard(
                        imageUrl: first['imageUrl'] ?? '',
                        companyName: first['name'] ?? '',
                        location: first['location'] ?? '',
                        rating: first['rating'] ?? '0.0',
                        onSaveTap: () {
                          print("Save the company");
                        },
                        onViewTap: () {
                          print("View Details");
                        },
                      ),
                    ),
                    const SizedBox(width: 1),
                    if (second != null)
                      Expanded(
                        child: PopularCompanyCard(
                          imageUrl: second['imageUrl'] ?? '',
                          companyName: second['name'] ?? '',
                          location: second['location'] ?? '',
                          rating: second['rating'] ?? '0.0',
                          onSaveTap: () {},
                          onViewTap: () {},
                        ),
                      )
                    else
                      const Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
