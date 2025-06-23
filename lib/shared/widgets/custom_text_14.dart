import 'package:flutter/material.dart';

class CustomText14 extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final int? maxLines;

  const CustomText14({
    super.key,
    required this.text,
    required this.color,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.letterSpacing,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
