import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/role_driver/chat/presentation/widgets/inbox_thread.dart';


class InboxListWidget extends StatelessWidget {
  const InboxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    final dummyChats = [
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
    ];

    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return Column(
          children: [
            InboxThreadWidget(
              name: chat['name']!,
              message: chat['message']!,
              imageUrl: chat['imageUrl']!,
              time: chat['time']!,
              unseenMessage: chat['unseen']!,
            ),
            // Divider(
            //   color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
            //   thickness: 0.8,
            //   height: 0,
            //   indent: 70, // optional: align with text start
            // ),
          ],
        );
      },
    );
  }
}
