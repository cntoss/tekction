import 'package:flutter/material.dart';
import 'package:tekction/home/ui/screen/call_page.dart';
import 'package:tekction/home/ui/widget/basket_widget.dart';
import 'package:tekction/home/ui/widget/chat_listview.dart';
import 'package:tekction/home/ui/widget/stream_text_row.dart';
import 'package:tekction/resource/color_manager.dart';
import 'package:tekction/service/locator.dart';

import '../../../common/app_constant.dart';
import '../widget/live_product.dart';

class LiveStreaming extends StatefulWidget {
  final bool? isBroadCaster;
  const LiveStreaming({super.key, this.isBroadCaster});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  final _sizeConfig = locator<SizeConfig>();
  bool isChatPage = true;

  final commentController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            SizedBox(
              height: isChatPage
                  ? _sizeConfig.blockSizeH * 88
                  : _sizeConfig.screenH,
              child: Stack(
                children: [
                  CallPage(
                    channel: channel,
                    isBroadcaster: widget.isBroadCaster ?? false,
                  ),
                  PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        isChatPage = page == 0;
                      });
                    },
                    children: [
                      Stack(
                        children: [
                          /* Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: TopBar(
                                showLiveInfo: true,
                                showGlass: true,
                              )), */
                          _blueOverlay,
                          const Positioned(
                            bottom: 0,
                            right: horizontalPadding,
                            child: BasketWidget(),
                          ),
                          _chat
                        ],
                      ),
                      Stack(
                        children: [
                          _blueOverlay,
                          /* const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: TopBar(
                                showLiveInfo: true,
                                showGlass: false,
                                showReport: false,
                              )), */
                          Positioned(
                              top: _sizeConfig.screenH / 2,
                              left: 0,
                              right: 0,
                              child: const LiveProductWidget())
                        ],
                      )
                    ],
                  ),
                  /* Positioned(
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
                  ), */
                ],
              ),
            ),
            if (isChatPage)
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

  Widget get _blueOverlay => Positioned(
        bottom: 0,
        left: 0,
        top: _sizeConfig.blockSizeH * 60,
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
      );

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
