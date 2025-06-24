
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';

class PopularCompanyCard extends StatelessWidget {
  final String imageUrl;
  final String companyName;
  final String location;
  final String rating; // Rating is a string
  final VoidCallback onSaveTap;
  final VoidCallback onViewTap;

  const PopularCompanyCard({
    super.key,
    required this.imageUrl,
    required this.companyName,
    required this.location,
    required this.rating,
    required this.onSaveTap,
    required this.onViewTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    final backgroundColor = Colors.transparent;
    final borderColor = isDark ? Colors.white10 : Colors.grey.shade300;
    final cardColor = isDark ? const Color(0xFF2B2B37) : Colors.white;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return Container(
      height: 260,
      margin: const EdgeInsets.all(8),
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
                right: 8,
                child: GestureDetector(
                  onTap: onSaveTap,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: isDark ? Colors.black : Colors.white,
                    child: const Icon(Icons.bookmark_border, color: AppColors.themeGreen),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            companyName,
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: 16, color: Colors.yellow),
                const SizedBox(width: 4),
                Text(
                  rating,
                  style: TextStyle(fontSize: 12, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
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
                child: const Text('View Details'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
