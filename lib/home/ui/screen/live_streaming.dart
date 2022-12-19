import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tekction/home/ui/screen/call_page.dart';
import 'package:tekction/home/ui/widget/basket_widget.dart';
import 'package:tekction/home/ui/widget/chat_listview.dart';
import 'package:tekction/home/ui/widget/stream_text_row.dart';
import 'package:tekction/resource/color_manager.dart';
import 'package:tekction/service/locator.dart';

import '../../../common/app_constant.dart';
import '../../../resource/asset_manager.dart';
import 'top_bar_live.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({super.key});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  final _sizeConfig = locator<SizeConfig>();

  final commentController = TextEditingController();

  var isBroadCaster;

  List<String> chatList = [
    'name1',
    'Amazinggg!!',
    'jiminfan',
    'Show us the model in black',
    'karla18',
    'Can i get it resized?',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
  ];

  @override
  void initState() {
    checkBroadcaster();
    super.initState();
  }

  checkBroadcaster() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    setState(() {
      isBroadCaster = _sharedPref.getBool(broadcasterKey) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            SizedBox(
              height: _sizeConfig.safeBlockH * 92,
              child: Stack(
                children: [
                  CallPage(
                    channel: channel,
                    isBroadcaster: isBroadCaster,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    top: _sizeConfig.screenH / 2,
                    right: 0,
                    child: Container(
                      height: _sizeConfig.screenH,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xff03174c)],
                      )),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: horizontalPadding,
                    child: BasketWidget(),
                  ),
                  _chat
                ],
              ),
            ),
            Expanded(
              child: StreamTextRow(
                commentController: commentController,
                onSendPressed: () {
                  setState(() {
                    chatList.add(commentController.text.trim());
                    commentController.clear();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _chat => Positioned(
        bottom: 0,
        left: 0,
        child: SizedBox(
          height: _sizeConfig.screenH / 3,
          child: ChatListView(
            chatList: chatList,
          ),
        ),
      );
}
