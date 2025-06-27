import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class DraggableRadiusSlider extends StatefulWidget {
  const DraggableRadiusSlider({super.key});

  @override
  State<DraggableRadiusSlider> createState() => _DraggableRadiusSliderState();
}

class _DraggableRadiusSliderState extends State<DraggableRadiusSlider> {
  double _currentValue = 75;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final containerColor = isDark ? Colors.white : Colors.black;

    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 200, maxWidth: 300 ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: containerColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Radius', style: TextStyle(fontSize: 12, color: textColor)),
                Text('${_currentValue.toInt()} Miles',
                    style: TextStyle(fontSize: 12, color: textColor)),
              ],
            ),

            const SizedBox(height: 10),

            // Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.themeGreen,
                inactiveTrackColor: Colors.white.withOpacity(0.6),
                thumbColor: Colors.white,
                overlayColor: AppColors.themeGreen.withOpacity(0.5),
              ),
              child: Slider(
                min: 0,
                max: 100,
                value: _currentValue,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 4),

            // Done Button (optional)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeGreen,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              onPressed: () {
                Navigator.of(context).pop(_currentValue.toInt());
              },
              child: const Text("Done"),
            )
          ],
        ),
      ),
    );
  }
}
