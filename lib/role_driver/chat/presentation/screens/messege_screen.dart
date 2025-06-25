import 'package:fleetsynctechnology/role_driver/chat/presentation/widgets/call_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fleetsynctechnology/config/theme.dart';
import 'package:fleetsynctechnology/shared/providers/theme_provider.dart';
import 'package:fleetsynctechnology/shared/widgets/dynamic_image_widgets.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  // final String senderId;
  // final String reiceverId;


  const MessageScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    // required this.senderId,
    // required this.reiceverId,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {'text': 'Hey! How are you?', 'isSent': true, 'time': '10:30 AM'},
    {'text': 'I’m good, thanks!', 'isSent': false, 'time': '10:31 AM'},
    {'text': 'Update me on the delivery.', 'isSent': true, 'time': '10:32 AM'},
    {'text': 'The delivery is on schedule. ETA is 3:00 PM.', 'isSent': false, 'time': '10:33 AM'},
    {'text': 'Perfect. Let me know once it reaches the warehouse.', 'isSent': true, 'time': '10:34 AM'},
    {'text': 'Sure. Anything else you want me to check?', 'isSent': false, 'time': '10:35 AM'},
    {'text': 'Yes, verify the document you received yesterday.', 'isSent': true, 'time': '10:36 AM'},
    {'text': 'Got it. I’ll review and send feedback by noon.', 'isSent': false, 'time': '10:37 AM'},
    {'text': 'Thanks. Also, please confirm the meeting time.', 'isSent': true, 'time': '10:38 AM'},
    {'text': 'Meeting is set for 4:00 PM. I’ve added it to the calendar.', 'isSent': false, 'time': '10:39 AM'},
    {'text': 'Great. I’ll prepare the slide deck.', 'isSent': true, 'time': '10:40 AM'},
    {'text': 'Let me know if you need help with the content.', 'isSent': false, 'time': '10:42 AM'},
    {'text': 'Sure, I’ll ping you after the first draft.', 'isSent': true, 'time': '10:43 AM'},
    {'text': 'Alright. Talk soon.', 'isSent': false, 'time': '10:44 AM'},
  ];


  final List<Map<String, dynamic>> chat = [

    {
      "users": [
        {
          "id": "u1",
          "name": "Alice",
          "profileImage": "https://i.pravatar.cc/150?img=1"
        },
        {
          "id": "u2",
          "name": "Bob",
          "profileImage": "https://i.pravatar.cc/150?img=2"
        }
      ],
      "chats": [
        {
          "chatId": "c1",
          "participants": ["u1", "u2"],
          "messages": [
            {
              "messageId": "m1",
              "senderId": "u1",
              "text": "Hey Bob! How's it going?",
              "timestamp": "2025-06-26T14:30:00Z",
              "status": "delivered"
            },
            {
              "messageId": "m2",
              "senderId": "u2",
              "text": "Hey Alice! Doing well, just finished work.",
              "timestamp": "2025-06-26T14:32:00Z",
              "status": "seen"
            },
            {
              "messageId": "m3",
              "senderId": "u1",
              "text": "Nice! Wanna catch up this weekend?",
              "timestamp": "2025-06-26T14:34:00Z",
              "status": "sent"
            }
          ]
        }
      ]
    }


  ];


  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': text,
          'isSent': true,
          'time': 'Now', // You can replace with actual formatted time if needed
        });
        messageController.clear();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }


  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    // Delay the scroll until the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }


  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final receiveBg = isDark ? const Color(0xFF55555F) : const Color(0xFFE6F9F1);
    print (widget.name);
    print (widget.imageUrl);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.themeGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: DynamicImage(imageUrl: widget.imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              showRequestPopup(
                context: context,
                name: 'Alice',
                message: 'Would like to connect with you.',
                imageUrl: 'https://i.pravatar.cc/150?img=1',
                onAccept: () {
                  Navigator.pop(context);
                  debugPrint("Accepted");
                },
                onDecline: () {
                  Navigator.pop(context);
                  debugPrint("Declined");
                },
              );
            },
            child: Icon(Icons.call, color: AppColors.themeGreen),
          ),
          SizedBox(width: 5,),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: textColor),
            onSelected: (value) {

                  debugPrint('Selected: $value');
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'block', child: Text('Block')),
              const PopupMenuItem(value: 'delete', child: Text('Delete Chat')),
              const PopupMenuItem(value: 'report', child: Text('Report')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isSent = msg['isSent'] as bool;
                return Align(
                  alignment: isSent ? Alignment.centerLeft : Alignment.centerRight ,
                  child: Column(
                    crossAxisAlignment: isSent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        decoration: BoxDecoration(
                          color: isSent ? AppColors.themeGreen : receiveBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg['text'],
                              style: TextStyle(
                                color: isSent ? Colors.white : textColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Text(
                          msg['time'],
                          style: TextStyle(
                            fontSize: 10,
                            color: isSent
                                ? Colors.white.withOpacity(0.8)
                                : textColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Input Bar
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1F1F2E) : Colors.white,
                boxShadow: [
                  if (!isDark)
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                ],
              ),
              child: Row(
                children: [
                  // Image Icon
                  IconButton(
                    icon: const Icon(Icons.image, color: AppColors.themeGreen),
                    onPressed: () {
                      debugPrint("Image icon clicked");
                    },
                  ),
                  // TextField
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onSubmitted: (value) {

                        sendMessage();

                        } ,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: textColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color:  textColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color:  textColor, width: 2),
                        ),
                      ),
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Send Button
                  ElevatedButton(
                    onPressed: () {

                      sendMessage();

                      },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: AppColors.themeGreen,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
