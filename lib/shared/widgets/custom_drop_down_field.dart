import 'package:flutter/material.dart';
import 'package:fleetsynctechnology/config/theme.dart';

class CustomDropdownField extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String? label;
  final Function(String?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.items,
    this.value,
    this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark
        ? AppColors.primaryTextOnDark
        : AppColors.primaryTextOnLight;

    final borderColor = isDark ? Colors.grey : Colors.black26;
    final floatingLabelColor = isDark ? Colors.white : Colors.black;

    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: TextStyle(color: textColor)),
        ),
      )
          .toList(),
      onChanged: onChanged,
      style: TextStyle(color: textColor, fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: borderColor, fontSize: 14),
        floatingLabelStyle: TextStyle(
          color: floatingLabelColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: floatingLabelColor, width: 2),
        ),
      ),
    );
  }
}
