import 'package:flutter/material.dart';
import 'package:tekction/home/ui/widget/basket_widget.dart';
import 'package:tekction/home/ui/widget/chat_listview.dart';
import 'package:tekction/home/ui/widget/stream_text_row.dart';
import 'package:tekction/resource/color_manager.dart';
import 'package:tekction/service/locator.dart';

import '../../../common/app_constant.dart';
import '../../../resource/asset_manager.dart';
import '../widget/live_product.dart';
import 'top_bar_live.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({super.key});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  final _sizeConfig = locator<SizeConfig>();
  bool isChatPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blue,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: _sizeConfig.blockSizeH * 85,
                  child: Image.asset(
                    ImageAssets.girlLive,
                    fit: BoxFit.fitWidth,
                    width: _sizeConfig.screenW,
                  ),
                ),
                if (isChatPage) Expanded(child: StreamTextRow())
              ],
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
                    const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: TopBar(
                          showLiveInfo: true,
                          showGlass: true,
                        )),
                    _blueOverlay,
                    Positioned(
                      top: _sizeConfig.safeBlockH * 92,
                      right: horizontalPadding,
                      child: const BasketWidget(),
                    ),
                    _chat
                  ],
                ),
                Stack(
                  children: [
                    _blueOverlay,
                    const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: TopBar(
                          showLiveInfo: true,
                          showGlass: false,
                          showReport: false,
                        )),
                    Positioned(
                        top: _sizeConfig.screenH / 2,
                        left: 0,
                        right: 0,
                        child: const LiveProductWidget())
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _blueOverlay => Positioned(
        bottom: _sizeConfig.blockSizeH * 15,
        left: 0,
        top: _sizeConfig.blockSizeH * 50,
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
      top: _sizeConfig.screenH / 1.5, left: 0, child: ChatListview());
}
