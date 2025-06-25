import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class InboxRequestThreadWidget extends StatelessWidget {
  final String name;
  final String message;
  final String imageUrl;
  final String time;
  final String unseenMessage;
  final VoidCallback onAvatarTap;
  final VoidCallback onNameMessageTap;
  final VoidCallback onAcceptTap;
  final VoidCallback onDeclineTap;

  const InboxRequestThreadWidget({
    super.key,
    required this.name,
    required this.message,
    required this.imageUrl,
    required this.time,
    required this.unseenMessage,
    required this.onAvatarTap,
    required this.onNameMessageTap,
    required this.onAcceptTap,
    required this.onDeclineTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;
    final bgColor = isDark ? const Color(0xFF1F1F2E) : Colors.white;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Clickable Profile Image
          InkWell(
            onTap: onAvatarTap,
            borderRadius: BorderRadius.circular(28),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(width: 12),

          // Clickable Name & Message Column
          Expanded(
            child: InkWell(
              onTap: onNameMessageTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.themeGreen,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor.withOpacity(0.8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Accept & Decline Buttons Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onAcceptTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      minimumSize: const Size(60, 28),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Accept', style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: onDeclineTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(60, 28),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Decline', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              // const SizedBox(height: 8),
              // Text(
              //   time,
              //   style: TextStyle(
              //     fontSize: 10,
              //     color: textColor.withOpacity(0.6),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
