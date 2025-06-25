import 'package:fleetsynctechnology/role_driver/Fuel%20Provider/presentation/screens/details_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/popular_company_card.dart';

class FuelProviderListPage extends StatefulWidget {
  const FuelProviderListPage({super.key});

  @override
  State<FuelProviderListPage> createState() => _FuelProviderListPageState();
}

class _FuelProviderListPageState extends State<FuelProviderListPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> companyList = [
    {
      'image': 'https://i.pravatar.cc/200?img=1',
      'name': 'GreenFuel Ltd.',
      'location': 'Dhaka, Bangladesh',
      'rating': '2.8',
      'shortDescription': 'Reliable fuel provider across Bangladesh.',
      'totalReviews': '234',
      'cardType': 'Corporate',
      'acceptedStations': 'Total, Padma, Jamuna',
      'discounts': '5% off every refill',
      'creditLine': 'Up to BDT 50,000',
      'cardCompanyName': 'GreenFuel Finance',
      'fullDescription': 'Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.Offers flexible payments and cashback options.',
    },
    {
      'image': 'https://i.pravatar.cc/200?img=2',
      'name': 'EcoPetro',
      'location': 'Chittagong, Bangladesh',
      'rating': '4.5',
      'shortDescription': 'Eco-friendly fuel and energy solutions.',
      'totalReviews': '189',
      'cardType': 'Personal',
      'acceptedStations': 'Padma, Meghna, Omera',
      'discounts': '2% cashback on Sundays',
      'creditLine': 'BDT 20,000 limit',
      'cardCompanyName': 'EcoPetro Bangladesh',
      'fullDescription': 'A green card for sustainable refueling.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/200?img=8',
      'companyName': 'FuelMate',
      'shortDescription': 'Fuel made easy for everyday drivers.',
      'rating': '4.5',
      'totalReviews': '178',
      'cardType': 'Personal',
      'acceptedStations': 'Padma, Total, Omera',
      'discounts': '3% cashback on mobile payments',
      'creditLine': 'BDT 15,000 limit',
      'cardCompanyName': 'FuelMate Services',
      'location': 'Sylhet, Bangladesh',
      'fullDescription': 'Ideal for private vehicle owners seeking simple and affordable refueling.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/200?img=9',
      'companyName': 'DrivePay',
      'shortDescription': 'Empowering fleet and logistics firms.',
      'rating': '4.8',
      'totalReviews': '320',
      'cardType': 'Corporate',
      'acceptedStations': 'Jamuna, Padma, Total',
      'discounts': '8% rebate on volume usage',
      'creditLine': 'BDT 100,000/month',
      'cardCompanyName': 'DrivePay Limited',
      'location': 'Rajshahi, Bangladesh',
      'fullDescription': 'Perfect for logistics and large fleets with real-time tracking and credit flexibility.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/200?img=10',
      'companyName': 'PetroGo',
      'shortDescription': 'Fast refueling. Smarter tracking.',
      'rating': '4.1',
      'totalReviews': '145',
      'cardType': 'Business',
      'acceptedStations': 'Omera, Meghna',
      'discounts': 'Free refill every 10th visit',
      'creditLine': 'BDT 25,000 credit',
      'cardCompanyName': 'PetroGo Solutions',
      'location': 'Barisal, Bangladesh',
      'fullDescription': 'Suited for city-based delivery services and small logistics firms.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/200?img=11',
      'companyName': 'FuelFlex',
      'shortDescription': 'Flexible options for families and travelers.',
      'rating': '3.8',
      'totalReviews':'88',
      'cardType': 'Personal',
      'acceptedStations': 'Padma, Jamuna, Meghna',
      'discounts': 'Family plan: Extra 1% per family member',
      'creditLine': 'BDT 18,000/month',
      'cardCompanyName': 'FuelFlex Pay',
      'location': 'Comilla, Bangladesh',
      'fullDescription': 'Designed for families with multiple vehicles and frequent travel routes.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/200?img=12',
      'companyName': 'ZenFuel',
      'shortDescription': 'Zen way to fuel your fleet.',
      'rating': '4.7',
      'totalReviews': '260',
      'cardType': 'Corporate',
      'acceptedStations': 'Zen, Padma, Total',
      'discounts': '10% discount on off-peak hours',
      'creditLine': 'BDT 80,000/month',
      'cardCompanyName': 'ZenFuel Corporation',
      'location': 'Jessore, Bangladesh',
      'fullDescription': 'Corporate card offering AI-driven fuel usage insights and digital invoicing.',
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

    final filteredList = companyList.where((item) {
      final query = searchQuery.toLowerCase();
      final name = item['name']?.toLowerCase() ?? '';
      final location = item['location']?.toLowerCase() ?? '';
      return name.contains(query) || location.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.themeGreen),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DynamicImage(
                      imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?fit=crop&w=800&q=80',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Fuel Provider',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Grid View
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: filteredList.isNotEmpty
                          ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          return PopularCompanyCard(
                            imageUrl: item['imageUrl'] ?? item['image'],
                            companyName: item['companyName'] ?? item['name'] ?? '',
                            location: item['location'] ?? '',
                            rating: item['rating'].toString(),
                            onSaveTap: () {
                              debugPrint('Saved ${item['name']}');
                            },
                            onViewTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CardDetailsScreen(
                                    imageUrl: item['imageUrl'] ?? item['image'] ?? '',
                                    companyName: item['companyName'] ?? item['name'] ?? '',
                                    shortDescription: item['shortDescription'] ?? '',
                                    rating: item['rating'].toString(),
                                    totalReviews: item['totalReviews'].toString(),
                                    cardType: item['cardType'] ?? '',
                                    acceptedStations: item['acceptedStations'] ?? '',
                                    discounts: item['discounts'] ?? '',
                                    creditLine: item['creditLine'] ?? '',
                                    cardCompanyName: item['cardCompanyName'] ?? '',
                                    location: item['location'] ?? '',
                                    fullDescription: item['fullDescription'] ?? '',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                          : Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Text(
                          'No companies found.',
                          style: TextStyle(color: textColor.withOpacity(0.6)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
