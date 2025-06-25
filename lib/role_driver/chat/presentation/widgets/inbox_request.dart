import 'package:fleetsynctechnology/role_driver/chat/presentation/widgets/inbox_request_thread.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';


class InboxRequestListWidget extends StatefulWidget {
  const InboxRequestListWidget({super.key});

  @override
  State<InboxRequestListWidget> createState() => _InboxRequestListWidgetState();
}

class _InboxRequestListWidgetState extends State<InboxRequestListWidget> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> dummyRequests = [
    {
      'name': 'David',
      'message': 'Request to connect for shipment.',
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'time': 'Today, 10:30 AM',
      'unseen': '1',
    },
    {
      'name': 'Emma',
      'message': 'Can we discuss the warehouse slots?',
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'time': 'Yesterday',
      'unseen': '0',
    },
  ];

  List<Map<String, String>> filteredRequests = [];

  @override
  void initState() {
    super.initState();
    filteredRequests = dummyRequests;

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredRequests = dummyRequests
            .where((chat) => chat['name']!.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            style: TextStyle(color: textColor),
          ),
        ),

        // Request List
        Expanded(
          child: ListView.builder(
            itemCount: filteredRequests.length,
            itemBuilder: (context, index) {
              final request = filteredRequests[index];
              return InboxRequestThreadWidget(
                name: request['name']!,
                message: request['message']!,
                imageUrl: request['imageUrl']!,
                time: request['time']!,
                unseenMessage: request['unseen']!,
                onAvatarTap: () {
                  debugPrint('Avatar tapped: ${request['name']}');
                },
                onNameMessageTap: () {
                  debugPrint('Name/message tapped: ${request['name']}');
                },
                onAcceptTap: () {
                  debugPrint('Accepted: ${request['name']}');
                },
                onDeclineTap: () {
                  debugPrint('Declined: ${request['name']}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
