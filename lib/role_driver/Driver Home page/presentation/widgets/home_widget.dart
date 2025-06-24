import 'package:fleetsynctechnology/role_driver/Driver%20Home%20page/presentation/widgets/upcoming_feature.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {


  final List<Map<String, dynamic>> features = [
    {
      'icon': Icon(Icons.star, color: Colors.orange),
      'title': 'Loyalty Rewards System',
    },
    {
      'icon': Image.asset('assets/icons/chat.png'),
      'title': 'Instant Chat with Support',
    },
    {
      'icon': Icon(Icons.map, color: Colors.blue),
      'title': 'Real-time Map Tracking',
    },
    {
      'icon': Icon(Icons.security, color: Colors.green),
      'title': 'Advanced Security',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Row
          Row(
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

          const SizedBox(height: 32),

          UpcomingFeatureContainer (),

          // Main Content
          Center(
            child: Column(
              children: const [
                Icon(Icons.home, size: 80, color: Colors.green),
                SizedBox(height: 16),
                Text(
                  'Welcome to FleetSync Home!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
