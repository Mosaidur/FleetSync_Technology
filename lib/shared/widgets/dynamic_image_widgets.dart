import 'package:flutter/material.dart';

class DynamicImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double borderRadius; // <-- New

  const DynamicImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 160,
    this.fit = BoxFit.cover,
    this.borderRadius = 8, // <-- Default radius
  });

  bool _isNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: _isNetworkUrl(imageUrl)
          ? Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      )
          : Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: 40,
      ),
    );
  }
}
