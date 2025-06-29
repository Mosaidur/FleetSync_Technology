import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/popular_company.dart';
import 'package:fleetsynctechnology/role_driver/Driver Home page/presentation/widgets/truck_sale_section.dart';
import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/upcoming_feature.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {


  final List<Map<String, dynamic>> demoTruckSales = [
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'additionalImages': [
        'https://i.pravatar.cc/150?img=4',
        'https://i.pravatar.cc/150?img=20',
        'https://i.pravatar.cc/150?img=21',
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


  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? AppColors.primaryTextOnDark : AppColors.primaryTextOnLight;

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

          // const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: UpcomingFeatureContainer (),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Companies',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle 'See All'


                    print("See all");
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.grey : AppColors.themeGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),

          PopularCompaniesSection(companyList: mockCompanies),

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

