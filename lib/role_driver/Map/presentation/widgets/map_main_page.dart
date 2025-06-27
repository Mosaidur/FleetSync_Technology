import 'package:fleetsynctechnology/role_driver/Map/presentation/widgets/DraggableRadiusSlider.dart';
import 'package:fleetsynctechnology/role_driver/Map/presentation/widgets/category_toggle_widget.dart';
import 'package:fleetsynctechnology/role_driver/Map/presentation/widgets/profile_card.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class MapMainPage extends StatefulWidget {
  const MapMainPage({super.key});

  @override
  State<MapMainPage> createState() => _MapMainPageState();
}

class _MapMainPageState extends State<MapMainPage> {
  final locationFromController = TextEditingController();
  final locationToController = TextEditingController();

  String searchQuery = '';
  double top = 400;
  double left = 150;

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF121212) : Colors.white;
    final borderColor = isDark ? Colors.white54 : Colors.grey;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 🔴 Removes back button
        backgroundColor: bgColor,         // optional: matches your theme
        elevation: 0,
        toolbarHeight: 160,               // adjust height to fit content
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // From & To Fields
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextField(
                      controller: locationFromController,
                      decoration: InputDecoration(
                        hintText: 'From',
                        prefixIcon: Icon(Icons.my_location, color: textColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.themeGreen, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextField(
                      controller: locationToController,
                      decoration: InputDecoration(
                        hintText: 'To',
                        prefixIcon: Icon(Icons.location_on, color: textColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.themeGreen, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Destination Button + Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Destination button tapped');


                        showDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.5),
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(20),
                            child: const DraggableRadiusSlider(),
                          ),
                        );


                      },


                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeGreen,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Destination'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {



                      },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.themeGreen,
                      child: Icon(Icons.location_on, color: textColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => debugPrint("People icon tapped"),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.themeGreen,
                      child: Icon(Icons.people_alt, color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [


          SizedBox.expand(
            child: DynamicImage(
              // Change to your dynamic image
              fit: BoxFit.cover,
              imageUrl: 'assets/images/map_image.png',
            ),
          ),

          Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  left += details.delta.dx;
                  top += details.delta.dy;
                });
              },
              onTap: () {
                debugPrint("Circle Image Tapped");
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: ProfileCardWidget(
                      imageUrl: 'https://i.pravatar.cc/150?img=3',
                      name: 'John Doe',
                      location: 'Los Angeles, California',
                      rating: 4.8,
                      reviews: 45,
                      profession: 'Mechanics',
                      ratePerHour: '30\$/hr',
                      description:
                      'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.',
                      onViewDetails: () {
                        Navigator.pop(context); // or navigate somewhere
                        debugPrint("View details tapped inside dialog");
                      },
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.themeGreen, width: 2),
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: DynamicImage(
                    fit: BoxFit.cover,
                    imageUrl: 'https://i.pravatar.cc/200?img=1',
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
