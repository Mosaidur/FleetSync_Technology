import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';

class TruckSaleCard extends StatelessWidget {
  final String imageUrl;
  final String truckModelName;
  final String location;
  final String info;
  final VoidCallback onSaveTap;
  final VoidCallback onViewTap;
  final VoidCallback onShareTap;
  final String buttonTitle;

  const TruckSaleCard({
    super.key,
    required this.imageUrl,
    required this.truckModelName,
    required this.location,
    required this.info,
    required this.onSaveTap,
    required this.onShareTap,
    required this.onViewTap,
    this.buttonTitle = "View Details",

  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    final backgroundColor = Colors.transparent;
    final borderColor = isDark ? Colors.white10 : Colors.grey.shade300;
    final cardColor = isDark ? const Color(0xFF2B2B37) : Colors.white;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              DynamicImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 10,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onSaveTap,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: isDark ? Colors.black : Colors.white,
                        child: const Icon(Icons.bookmark_border, color: AppColors.themeGreen, size: 18),
                      ),
                    ),
                    SizedBox(height:  10,),
                    GestureDetector(
                      onTap: onShareTap,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: isDark ? Colors.black : Colors.white,
                        child: const Icon(Icons.share, color: AppColors.themeGreen, size: 18),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 8),
          Text(
            truckModelName,
            style: const TextStyle(
              color: AppColors.themeGreen,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: textColor),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(fontSize: 11, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
              ],
            ),
            child: Text(
              info,
              style: TextStyle(fontSize: 12, color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: onViewTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonTitle,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
