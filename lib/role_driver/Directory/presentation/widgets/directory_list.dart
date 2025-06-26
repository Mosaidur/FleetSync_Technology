import 'package:fleetsynctechnology/role_driver/Directory/presentation/widgets/company_details.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/popular_company_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';



class DirectorListPage extends StatefulWidget {
  const DirectorListPage({Key? key}) : super(key: key);

  @override
  State<DirectorListPage> createState() => _DirectorListPageState();
}

class _DirectorListPageState extends State<DirectorListPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> allCompanies = [
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1581090464777-4c4f50a9b5ea",
      "companyName": "TransFleet Logistics Ltd.",
      "location": "Dhaka",
      "rating": "4.8",
      "totalReviews": "132",
      "totalTruck": "80",
      "totalEmployee": "150",
      "experience": "12",
      "officeHour": "Mon–Sat, ",
      "time": "8:00 AM – 6:00 PM",
      "description": "TransFleet Logistics Ltd. is a leading transportation and logistics company providing secure, fast, and reliable cargo solutions across Bangladesh."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1558888401-15cb0f7c85b4",
      "companyName": "Rapid Haulage Co.",
      "location": "Chittagong",
      "rating": "4.5",
      "totalReviews": "95",
      "totalTruck": "60",
      "totalEmployee": "110",
      "experience": "9",
      "officeHour": "Sun–Fri, ",
      "time": "9:00 AM – 5:30 PM",
      "description": "Rapid Haulage specializes in timely freight services, focusing on long-haul delivery and industrial equipment logistics."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1604772369214-b84a9c4c0e7b",
      "companyName": "Express Movers BD",
      "location": "Khulna",
      "rating": "4.2",
      "totalReviews": "67",
      "totalTruck": "45",
      "totalEmployee": "95",
      "experience": "7",
      "officeHour": "Mon–Fri, ",
      "time": "10:00 AM – 6:00 PM",
      "description": "Express Movers BD offers household and commercial moving services with utmost professionalism and customer satisfaction."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1605283172527-ea950f6d5e41",
      "companyName": "EcoLine Carriers",
      "location": "Sylhet",
      "rating": "4.9",
      "totalReviews": "154",
      "totalTruck": "90",
      "totalEmployee": "180",
      "experience": "14",
      "officeHour": "Mon–Sat, ",
      "time": "9:30 AM – 7:00 PM",
      "description": "EcoLine Carriers integrates eco-friendly logistics with high-efficiency trucking operations across Bangladesh’s rural and urban regions."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1601132354372-8425e26f39e6",
      "companyName": "HighGear Transport",
      "location": "Rajshahi",
      "rating": "4.4",
      "totalReviews": "88",
      "totalTruck": "50",
      "totalEmployee": "120",
      "experience": "10",
      "officeHour": "Sun–Thu, ",
      "time": "9:00 AM – 5:00 PM",
      "description": "HighGear Transport offers consistent trucking, warehousing, and cross-border solutions for medium and large enterprises."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1557844352-761f2565b5e1",
      "companyName": "MegaLift Logistics",
      "location": "Barisal",
      "rating": "4.3",
      "totalReviews": "59",
      "totalTruck": "40",
      "totalEmployee": "90",
      "experience": "6",
      "officeHour": "Mon–Fri, ",
      "time": "10:00 AM – 6:00 PM",
      "description": "MegaLift Logistics provides crane transport and specialized cargo services for construction and infrastructure projects."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1572307480814-815abf7c5d86",
      "companyName": "SwiftRoute Ltd.",
      "location": "Rangpur",
      "rating": "4.6",
      "totalReviews": "112",
      "totalTruck": "70",
      "totalEmployee": "130",
      "experience": "11",
      "officeHour": "Sat–Thu, ",
      "time": "8:30 AM – 6:30 PM",
      "description": "SwiftRoute Ltd. is known for its precise delivery schedules, transparent operations, and excellent customer feedback."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1602802001971-52d98684fca0",
      "companyName": "BanglaFreight",
      "location": "Mymensingh",
      "rating": "4.0",
      "totalReviews": "72",
      "totalTruck": "55",
      "totalEmployee": "100",
      "experience": "8",
      "officeHour": "Sun–Fri, ",
      "time": "9:00 AM – 6:00 PM",
      "description": "BanglaFreight is a regional logistics firm helping local businesses scale their supply chain infrastructure affordably."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1602866836039-5a410da4e4b1",
      "companyName": "CargoLine Bangladesh",
      "location": "Cumilla",
      "rating": "4.7",
      "totalReviews": "140",
      "totalTruck": "85",
      "totalEmployee": "145",
      "experience": "13",
      "officeHour": "Mon–Sat, ",
      "time": "8:00 AM – 6:00 PM",
      "description": "CargoLine offers premium freight and delivery services with real-time GPS tracking and dedicated fleet management."
    },
    {
      "coverImageUrl": "https://images.unsplash.com/photo-1578496781985-d1dbbbb72a13",
      "companyName": "Pathway Express Ltd.",
      "location": "Gazipur",
      "rating": "4.1",
      "totalReviews": "64",
      "totalTruck": "42",
      "totalEmployee": "85",
      "experience": "5",
      "officeHour": "Mon–Fri, ",
      "time": "9:00 AM – 5:30 PM",
      "description": "Pathway Express Ltd. focuses on secure parcel movement and direct-to-factory delivery solutions for garment industries."
    }
  ];
  List<Map<String, dynamic>> filteredList = [];

  @override
  void initState() {
    super.initState();
    // TODO: Load your JSON data into allCompanies
    filteredList = allCompanies;
  }

  void onSearchChanged(String query) {
    setState(() {
      filteredList = allCompanies
          .where((item) => (item['companyName'] ?? '')
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                controller: searchController,
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon:
                  const Icon(Icons.search, color: AppColors.themeGreen),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: AppColors.themeGreen, width: 2),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                style: TextStyle(color: textColor),
              ),
            ),

            // Title Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular Companies',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Grid View inside Expanded
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: filteredList.isNotEmpty
                    ? GridView.builder(
                  itemCount: filteredList.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return PopularCompanyCard(
                      imageUrl:
                      item['imageUrl'] ?? item['coverImageUrl'],
                      companyName:
                      item['companyName'] ?? item['name'] ?? '',
                      location: item['location'] ?? '',
                      rating: item['rating'].toString(),
                      onSaveTap: () {
                        debugPrint('Saved ${item['companyName']}');
                      },
                      onViewTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CompanyDetailsPage(
                              coverImageUrl: item['coverImageUrl'] ??
                                  item['imageUrl'],
                              companyName: item['companyName'],
                              location: item['location'],
                              rating: item['rating'].toString(),
                              totalReviews:
                              item['totalReviews'].toString(),
                              totalTruck: item['totalTruck'].toString(),
                              totalEmployee:
                              item['totalEmployee'].toString(),
                              experience:
                              item['experience'].toString(),
                              officeHour: item['officeHour'],
                              time: item['time'],
                              description: item['description'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
                    : Center(
                  child: Text(
                    'No companies found.',
                    style:
                    TextStyle(color: textColor.withOpacity(0.6)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
