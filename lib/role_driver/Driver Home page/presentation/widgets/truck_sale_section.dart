import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/role_driver/Driver Home page/presentation/widgets/truck_info_card.dart';


class TruckSalesSection extends StatelessWidget {
  final List<Map<String, String>> truckList;
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
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: truckList.length,
            itemBuilder: (context, index) {
              final truck = truckList[index];
              return TruckSaleCard(
                imageUrl: truck['imageUrl'] ?? '',
                truckModelName: truck['model'] ?? '',
                location: truck['location'] ?? '',
                info: truck['info'] ?? '',
                onSaveTap: () => debugPrint('Saved: ${truck['model']}'),
                onShareTap: () => debugPrint('Shared: ${truck['model']}'),
                onViewTap: () => debugPrint('Viewed: ${truck['model']}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
