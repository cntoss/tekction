import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.chatList,
  });

  /// Chat messages.
  final List<String> chatList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var chat in chatList) ...[
              Text(
                'username${chatList.indexOf(chat)}',
                style: const TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
              ),
              const SizedBox(height: 4),
              Text(
                chat,
                style: const TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
              ),
              const SizedBox(height: 16),
            ]
          ],
        ),
      ),
    );
  }
}
