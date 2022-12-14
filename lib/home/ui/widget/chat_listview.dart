import 'package:flutter/material.dart';

import '../../../common/app_constant.dart';

class ChatListview extends StatelessWidget {
  const ChatListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'name1',
            style: TextStyle(fontSize: 13, color: Color(0xffE0E2EE)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Amazinggg !!',
            style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'jiminfan',
            style: TextStyle(fontSize: 13, color: Color(0xffE0E2EE)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Show us the model in black',
            style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'karla18',
            style: TextStyle(fontSize: 13, color: Color(0xffE0E2EE)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Can i get it resized?',
            style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Karla18 just joined',
            style: TextStyle(fontSize: 13, color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
