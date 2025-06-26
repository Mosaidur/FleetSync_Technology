import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/truck_info_card.dart';
import 'package:fleetsynctechnology/role_driver/Truck%20Sales/presentation/screens/truck_details_screen.dart';
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

  final List<Map<String, dynamic>> trucks = [
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=4',
        'https://i.pravatar.cc/150?img=20',
        'https://i.pravatar.cc/150?img=21'
      ],
      'truckCompanyName': 'Hino 500',
      'location': 'Dhaka',
      'shortDescription': 'Heavy-duty truck suitable for long hauls.',
      'price': '30000',
      'modelName': 'Hino 500 FG8J',
      'brandName': 'Hino',
      'manufactureYear': '2020',
      'mileage': '120,000 km',
      'transmissionType': 'Manual',
      'engineType': 'Diesel',
      'condition': 'Used',
      'axells': '2',
      'ownerName': 'Rahim Uddin',
      'ownerImageUrl': 'https://i.pravatar.cc/150?img=12',
      'fullDescription': 'This Hino 500 truck is in excellent condition. It has a powerful diesel engine and can carry heavy loads across long distances.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=5',
        'https://i.pravatar.cc/150?img=22',
        'https://i.pravatar.cc/150?img=23'
      ],
      'truckCompanyName': 'Ashok Leyland Boss',
      'location': 'Chittagong',
      'shortDescription': 'Efficient mid-sized truck for urban logistics.',
      'price': '25000',
      'modelName': 'Boss 912',
      'brandName': 'Ashok Leyland',
      'manufactureYear': '2019',
      'mileage': '95,000 km',
      'transmissionType': 'Manual',
      'engineType': 'CNG',
      'condition': 'Used',
      'axells': '2',
      'ownerName': 'Karim Khan',
      'ownerImageUrl': 'https://i.pravatar.cc/150?img=14',
      'fullDescription': 'A mid-size truck great for intra-city logistics with impressive fuel efficiency and payload capacity.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=6',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=6',
        'https://i.pravatar.cc/150?img=24',
        'https://i.pravatar.cc/150?img=25'
      ],
      'truckCompanyName': 'Tata LPT 3118',
      'location': 'Sylhet',
      'shortDescription': 'Reliable cargo carrier from Tata.',
      'price': '27000',
      'modelName': 'LPT 3118',
      'brandName': 'Tata',
      'manufactureYear': '2018',
      'mileage': '135,000 km',
      'transmissionType': 'Manual',
      'engineType': 'Diesel',
      'condition': 'Used',
      'axells': '3',
      'ownerName': 'Sumon Das',
      'ownerImageUrl': 'https://i.pravatar.cc/150?img=16',
      'fullDescription': 'The Tata LPT is a robust vehicle with excellent performance on highways and off-road conditions.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=7',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=7',
        'https://i.pravatar.cc/150?img=26',
        'https://i.pravatar.cc/150?img=27'
      ],
      'truckCompanyName': 'Isuzu FTR 850',
      'location': 'Rajshahi',
      'shortDescription': 'Advanced hybrid truck for green transport.',
      'price': '40000',
      'modelName': 'FTR 850 Hybrid',
      'brandName': 'Isuzu',
      'manufactureYear': '2021',
      'mileage': '60,000 km',
      'transmissionType': 'Automatic',
      'engineType': 'Hybrid',
      'condition': 'New',
      'axells': '2',
      'ownerName': 'Nasir Ahmed',
      'ownerImageUrl': 'https://i.pravatar.cc/150?img=18',
      'fullDescription': 'Eco-friendly truck designed for high performance and low emissions. Great for modern fleet operations.',
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=8',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=8',
        'https://i.pravatar.cc/150?img=28',
        'https://i.pravatar.cc/150?img=29'
      ],
      'truckCompanyName': 'Mahindra Blazo',
      'location': 'Khulna',
      'shortDescription': 'High torque and efficiency for intercity transport.',
      'price': '28000',
      'modelName': 'Blazo X 49',
      'brandName': 'Mahindra',
      'manufactureYear': '2022',
      'mileage': '40,000 km',
      'transmissionType': 'Manual',
      'engineType': 'Diesel',
      'condition': 'Used',
      'axells': '2',
      'ownerName': 'Asad Hossain',
      'ownerImageUrl': 'https://i.pravatar.cc/150?img=19',
      'fullDescription': 'Powerful intercity vehicle from Mahindra with proven durability in harsh conditions.',
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

      return [
        truck['truckCompanyName'],
        truck['location'],
        truck['modelName'],
        truck['brandName'],
        truck['engineType'],
        truck['transmissionType'],
        truck['condition'],
        truck['ownerName'],
        truck['shortDescription'],
        truck['fullDescription'],
      ].any((value) => (value ?? '').toLowerCase().contains(query));
    }).toList();


    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: searchController,
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search by company or location...',
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
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Truck Sales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
          const SizedBox(height: 12),
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
                    imageUrl: truck['imageUrl'],
                    truckModelName: truck['truckCompanyName'],
                    location: truck['location'],
                    info: '${truck['mileage']} • ${truck['engineType']} • ${truck['axells']} Axles',
                    onSaveTap: () {

                    },
                    onViewTap: () {
                      debugPrint("View: ${truck['truckCompanyName']}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TruckDetailsScreen(
                            imageUrl: truck['imageUrl'],
                            additionalImages: List<String>.from(truck['additionalImages']),
                            truckCompanyName: truck['truckCompanyName'],
                            location: truck['location'],
                            shortDescription: truck['shortDescription'],
                            price: truck['price'],
                            modelName: truck['modelName'],
                            brandName: truck['brandName'],
                            manufactureYear: truck['manufactureYear'],
                            mileage: truck['mileage'],
                            transmissionType: truck['transmissionType'],
                            engineType: truck['engineType'],
                            condition: truck['condition'],
                            axells: truck['axells'],
                            ownerName: truck['ownerName'],
                            ownerImageUrl: truck['ownerImageUrl'],
                            fullDescription: truck['fullDescription'],
                            createPost: false,
                            onSendRequest: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Request Sent")),
                              );
                            },
                            onDeletePost: () {

                              print("Deleted the post");

                            },
                            onSaveAndChange: () {

                              print("Save And Change");

                            },
                          ),
                        ),
                      );


                    },
                    onShareTap: () {
                      debugPrint("Share: ${truck['truckCompanyName']}");
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
