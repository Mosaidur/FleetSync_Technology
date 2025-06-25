import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/role_driver/chat/presentation/widgets/inbox_thread.dart';

class InboxListWidget extends StatefulWidget {
  const InboxListWidget({super.key});

  @override
  State<InboxListWidget> createState() => _InboxListWidgetState();
}

class _InboxListWidgetState extends State<InboxListWidget> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> dummyChats = [
    {
      'name': 'Alice',
      'message': 'Let’s confirm the delivery route.',
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
      'time': '2:15 PM',
      'unseen': '3'
    },
    {
      'name': 'Bob',
      'message': 'Thanks for the docs.',
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
      'time': '1:05 PM',
      'unseen': '0'
    },
    {
      'name': 'Charlie',
      'message': 'Updated the invoice file.',
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'time': 'Yesterday',
      'unseen': '1'
    },
  ];

  List<Map<String, String>> filteredChats = [];

  @override
  void initState() {
    super.initState();
    filteredChats = dummyChats;

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      setState(() {
        filteredChats = dummyChats
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            style: TextStyle(color: textColor),
          ),
        ),

        // List of Chats
        Expanded(
          child: ListView.builder(
            itemCount: filteredChats.length,
            itemBuilder: (context, index) {
              final chat = filteredChats[index];
              return InboxThreadWidget(
                name: chat['name']!,
                message: chat['message']!,
                imageUrl: chat['imageUrl']!,
                time: chat['time']!,
                unseenMessage: chat['unseen']!,
                onTap: () {

                  Navigator.pushNamed(
                    context,
                    '/driverChats',
                    arguments: {
                      'name': chat['name']!,
                      'imageUrl': chat?['imageUrl']?? 'https://i.pravatar.cc/150?img=2',
                    },
                  );
                  debugPrint('Tapped: ${chat['name']}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
