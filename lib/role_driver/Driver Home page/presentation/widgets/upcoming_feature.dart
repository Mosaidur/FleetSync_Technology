import 'package:fleetsynctechnology/config/theme.dart';
import 'package:flutter/material.dart';

class UpcomingFeatureContainer extends StatelessWidget {
  UpcomingFeatureContainer({super.key});

  final List<Map<String, dynamic>> _features = [
    {
      'icon': Image.asset('assets/icons/DispatchService.png'),
      'title': 'Dispatch \nService',
    },
    {
      'icon': Image.asset('assets/icons/ELDService.png'),
      'title': 'ELD \nService',
    },
    {
      'icon': Image.asset('assets/icons/TimestampCamera.png'),
      'title': 'Timestamp \nCamera',
    },
    {
      'icon': Image.asset('assets/icons/TandemSlideCalculate.png'),
      'title': 'Tandem Slide \nCalculate',
    },
    {
      'icon': Image.asset('assets/icons/CLDPrepTests.png'),
      'title': 'CLD Prep \nTests',
    },
    {
      'icon': Image.asset('assets/icons/AIAssistant.png'),
      'title': 'AI \nAssistant',
    },
  ];

  Widget _buildFeatureItem(BuildContext context, Map<String, dynamic> feature) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

    return GestureDetector(
      onTap: () => debugPrint('Tapped on: ${feature['title']}'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        // decoration: BoxDecoration(
        //   color: theme.cardColor,
        //   borderRadius: BorderRadius.circular(12),
        //   boxShadow: [
        //     BoxShadow(
        //       color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.1),
        //       blurRadius: 4,
        //       offset: const Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Row(
          children: [
            SizedBox(width: 32, height: 32, child: feature['icon'] as Widget),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                feature['title'] as String,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.bodyLarge?.color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5,right: 5),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Features',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: theme.textTheme.titleMedium?.color,
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            itemCount: _features.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) =>
                _buildFeatureItem(context, _features[index]),
          ),
        ],
      ),
    );
  }
}
