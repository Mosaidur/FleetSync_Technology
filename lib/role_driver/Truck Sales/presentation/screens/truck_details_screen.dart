import 'package:fleetsynctechnology/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';

class TruckDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final List<String> additionalImages;
  final String truckCompanyName;
  final String location;
  final String shortDescription;
  final String price;
  final String modelName;
  final String brandName;
  final String manufactureYear;
  final String mileage;
  final String transmissionType;
  final String engineType;
  final String condition;
  final String axells;
  final String ownerName;
  final String ownerImageUrl;
  final String fullDescription;
  final bool createPost;
  final VoidCallback onSendRequest;
  final VoidCallback onDeletePost;
  final VoidCallback onSaveAndChange;

  const TruckDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.additionalImages,
    required this.truckCompanyName,
    required this.location,
    required this.shortDescription,
    required this.price,
    required this.modelName,
    required this.brandName,
    required this.manufactureYear,
    required this.mileage,
    required this.transmissionType,
    required this.engineType,
    required this.condition,
    required this.axells,
    required this.ownerName,
    required this.ownerImageUrl,
    required this.fullDescription,
    required this.createPost,
    required this.onSendRequest,
    required this.onDeletePost,
    required this.onSaveAndChange,
  });

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  late String selectedImageUrl;

  @override
  void initState() {
    super.initState();
    selectedImageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final priceBarColor = isDark ? AppColors.themeGreen.withOpacity(0.1) : AppColors.themeGreen;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Truck Details",
          style: TextStyle(color: AppColors.themeGreen),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DynamicImage(imageUrl: selectedImageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 12),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: widget.additionalImages.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() => selectedImageUrl = widget.additionalImages[index]);
                    },
                    child: DynamicImage(
                      imageUrl: widget.additionalImages[index],
                      height: 80,
                      width: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.truckCompanyName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.themeGreen)),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(widget.location, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              Text(widget.shortDescription, textAlign: TextAlign.justify, style: TextStyle(fontSize: 12, color: textColor)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: priceBarColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("\$${widget.price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoRow(context, "Model Name", widget.modelName),
              _buildInfoRow(context, "Brand Name", widget.brandName),
              _buildInfoRow(context, "Manufacturer Year", widget.manufactureYear),
              _buildInfoRow(context, "Mileage", widget.mileage),
              _buildInfoRow(context, "Transmission Type", widget.transmissionType),
              _buildInfoRow(context, "Engine Type", widget.engineType),
              _buildInfoRow(context, "Condition", widget.condition),
              _buildInfoRow(context, "Axells", widget.axells),
              const SizedBox(height: 20),
              Text("Owner of the truck", style: TextStyle(fontSize: 12, color: textColor)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.themeGreen, width: 2),
                    ),
                    child: ClipOval(child: DynamicImage(imageUrl: widget.ownerImageUrl)),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.ownerName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.themeGreen)),
                      Text("Owner", style: TextStyle(fontSize: 12, color: textColor)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(widget.fullDescription, textAlign: TextAlign.justify, style: TextStyle(fontSize: 12, color: textColor)),
              const SizedBox(height: 24),
              if (!widget.createPost)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onSendRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text("Send Request"),
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onDeletePost,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text("Delete Post"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onSaveAndChange,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeGreen,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text("Save & Change"),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "$label: ",
                style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(color: AppColors.themeGreen, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
