import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/popular_company.dart';
import 'package:fleetsynctechnology/role_driver/Driver Home page/presentation/widgets/truck_sale_section.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/upcoming_feature.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {


  final demoTruckSales = [
    {
      'imageUrl': 'assets/images/popular_company_1.png',
      'model': 'Volvo VNL 760',
      'location': 'Dallas, TX',
      'info': '2019 · 450K miles',
    },
    {
      'imageUrl': 'https://example.com/truck2.jpg',
      'model': 'Freightliner Cascadia',
      'location': 'Chicago, IL',
      'info': '2020 · 390K miles',
    },
    {
      'imageUrl': 'https://example.com/truck3.jpg',
      'model': 'Kenworth T680',
      'location': 'Atlanta, GA',
      'info': '2018 · 510K miles',
    },
  ];


  List<Map<String, String>> mockCompanies = [
    {
      "imageUrl": "assets/images/popular_company_1.png",
      "name": "LogiPro Ltd.",
      "location": "California, USA",
      "rating": "4.5",
    },
    {
      "imageUrl": "assets/images/popular_company_2.png",
      "name": "TruckerZ Hub",
      "location": "Texas, USA",
      "rating": "4.2",
    },
    {
      "imageUrl": "assets/images/popular_company_1.png",
      "name": "CargoWave",
      "location": "New York, USA",
      "rating": "4.8",
    },
  ];


  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SingleChildScrollView(
      // padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          // Search Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                // Search Input Field
                Expanded(
                  child: TextField(
                    controller: searchController,
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
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Circular Search Icon Button
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green, // Theme green
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.white),
                    onPressed: () {
                      // Handle search button click
                      final query = searchController.text.trim();
                      debugPrint("Search query: $query");
                    },
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UpcomingFeatureContainer (),
          ),

          PopularCompaniesSection(companyList: mockCompanies,),

          const SizedBox(height: 8),

          InkWell(
            onTap: () {
              print ("Choose your Fuel Card");
            },
              child: DynamicImage(imageUrl: 'assets/images/Fuel_card_Banener_image.png',)
          ),

          const SizedBox(height: 8),

          TruckSalesSection(truckList: demoTruckSales),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

