import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class ProfileCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double rating;
  final int reviews;
  final String profession;
  final String ratePerHour;
  final String description;
  final VoidCallback onViewDetails;

  const ProfileCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.profession,
    required this.ratePerHour,
    required this.description,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;
    final bgColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Info Row
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade300,
              child: ClipOval(
                child: DynamicImage(imageUrl: imageUrl),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: subTextColor),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(location,
                            style: TextStyle(
                                fontSize: 12, color: subTextColor),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : const Color(0xFFBDBDC1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star,
                      size: 14, color: Colors.amberAccent),
                  const SizedBox(width: 4),
                  Text(
                    '$rating($reviews)',
                    style: TextStyle(fontSize: 12, color: textColor),
                  )
                ],
              ),
            )
          ],
        ),

        const SizedBox(height: 12),

        // Profession and Rate Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(profession,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.w600)),
            Text(ratePerHour,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.w600)),
          ],
        ),

        const SizedBox(height: 8),

        // Description
        Text(
          description,
          style: TextStyle(fontSize: 12, color: subTextColor),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 12),

        // View Details Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onViewDetails,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text(
              'View details',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
