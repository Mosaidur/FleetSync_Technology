import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/truck_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';

class TruckSalesListWidget extends StatefulWidget {
  const TruckSalesListWidget({super.key});

  @override
  State<TruckSalesListWidget> createState() => _TruckSalesListWidgetState();
}

class _TruckSalesListWidgetState extends State<TruckSalesListWidget> {
  final TextEditingController searchController = TextEditingController();

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

  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? const Color(0xFF121212) : Colors.white;

    final filteredTrucks = trucks.where((truck) {
      final query = searchQuery.toLowerCase();
      return (truck['truckModelName'] ?? '').toLowerCase().contains(query) ||
          (truck['location'] ?? '').toLowerCase().contains(query);
    }).toList();

    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, color: Colors.green),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(color: textColor),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Truck Sales',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // GridView
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: filteredTrucks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final truck = filteredTrucks[index];
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
