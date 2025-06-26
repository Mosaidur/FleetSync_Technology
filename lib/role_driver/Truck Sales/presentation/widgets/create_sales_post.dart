import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/truck_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class CreateSalesPostWidget extends StatelessWidget {
  const CreateSalesPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF121212) : Colors.white;

    final List<Map<String, String>> trucks = [
      {
        'imageUrl': 'https://i.pravatar.cc/150?img=4',
        'truckModelName': 'Hino 500',
        'location': 'Dhaka',
        'info': '2019 • Diesel • 6 Wheels',
      },
      {
        'imageUrl': 'https://i.pravatar.cc/150?img=4',
        'truckModelName': 'Ashok Leyland',
        'location': 'Chittagong',
        'info': '2020 • CNG • 10 Wheels',
      },
      {
        'imageUrl': 'https://i.pravatar.cc/150?img=4',
        'truckModelName': 'Tata LPT',
        'location': 'Sylhet',
        'info': '2018 • Diesel • 6 Wheels',
      },
      {
        'imageUrl': 'https://i.pravatar.cc/150?img=4',
        'truckModelName': 'Isuzu FTR',
        'location': 'Rajshahi',
        'info': '2021 • Hybrid • 8 Wheels',
      },
    ];

    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Title: Create A Post
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Create A Post',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Circle Icon
            Center(
              child: InkWell(
                onTap: () {
                  debugPrint("Create Icon Tapped");
                  // Trigger create form or modal
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid, // Solid border as fallback
                    ),
                  ),
                  child: const Icon(Icons.add, size: 48, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Create Now Button
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeGreen,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      debugPrint("Create Now Button Tapped");
                    },
                    child: const Text(
                      'Create Now',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title: Post List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Post List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Grid View
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: trucks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final truck = trucks[index];
                  return TruckSaleCard(
                    imageUrl: truck['imageUrl']!,
                    truckModelName: truck['truckModelName']!,
                    location: truck['location']!,
                    info: truck['info']!,
                    onSaveTap: () {
                      debugPrint("Saved: ${truck['truckModelName']}");
                    },
                    onViewTap: () {
                      debugPrint("View: ${truck['truckModelName']}");
                    },
                    onShareTap: () {
                      debugPrint("Share: ${truck['truckModelName']}");
                    },
                    buttonTitle: "Edit Post",
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
