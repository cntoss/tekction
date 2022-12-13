import 'package:flutter/material.dart';
import 'package:tekction/service/locator.dart';

import '../../../resource/asset_manager.dart';

class LiveWithChat extends StatefulWidget {
  const LiveWithChat({super.key});

  @override
  State<LiveWithChat> createState() => _LiveWithChatState();
}

class _LiveWithChatState extends State<LiveWithChat> {
  final _sizeConfig = locator<SizeConfig>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            ImageAssets.girlLive,
            fit: BoxFit.fitWidth,
            width: _sizeConfig.screenW,
          ),
          Container()
        ],
      ),
    );
  }
}
