import 'package:flutter/material.dart';

import '../widget/rsvp_container.dart';
import 'top_bar_live.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  var isRsvped = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          Image.network(
            'https://picsum.photos/${size.width.toInt()}/${size.height.toInt()}',
          ),
          Column(
            children: [
              const TopBar(showLiveInfo: true),
              // TopBar(showLiveInfo: false),
              const Spacer(),
              RsvpContainer(
                isRsvped: isRsvped,
                imageUrl: 'https://picsum.photos/300/300',
                vendor: 'jackyoung',
                description: 'Live sale on all Apple products !!',
                time: 'Today 9:00PM',
                totalNumber: '629',
                onRsvpPressed: () {
                  setState(() {
                    isRsvped = !isRsvped;
                  });
                },
                onRsvpCancelPressed: () {
                  setState(() {
                    isRsvped = !isRsvped;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


