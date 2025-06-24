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

    return Expanded(
      child: GestureDetector(
        onTap: () => debugPrint('Tapped on: ${feature['title']}'),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
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
          const SizedBox(height: 12),
          // Build rows with 2 items each
          for (int i = 0; i < _features.length; i += 2)
            Row(
              children: [
                _buildFeatureItem(context, _features[i]),
                if (i + 1 < _features.length)
                  _buildFeatureItem(context, _features[i + 1])
                else
                  const Expanded(child: SizedBox()), // empty space for odd count
              ],
            ),
        ],
      ),
    );
  }
}
