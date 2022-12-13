import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tekction/resource/color_manager.dart';
import 'package:tekction/service/locator.dart';

import '../../../resource/asset_manager.dart';
import 'top_bar_live.dart';

class LiveWithChat extends StatefulWidget {
  const LiveWithChat({super.key});

  @override
  State<LiveWithChat> createState() => _LiveWithChatState();
}

class _LiveWithChatState extends State<LiveWithChat> {
  final _sizeConfig = locator<SizeConfig>();
  double horizontalPadding = 30;
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
                  Image.asset(
                    ImageAssets.girlLive,
                    fit: BoxFit.fitWidth,
                    width: _sizeConfig.screenW,
                  ),
                  const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: TopBar(
                        showLiveInfo: true,
                        showGlass: true,
                      )),
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
                  Positioned(
                    bottom: 0,
                    right: horizontalPadding,
                    child: Stack(children: [
                      SizedBox(
                        width: 30,
                        height: 40,
                        child: SvgPicture.asset(
                          SvgAsset.basket,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: CircleAvatar(
                          maxRadius: 11,
                          backgroundColor: Colors.red,
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ]),
                  ),
                  _chat
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  0,
                  horizontalPadding,
                  10,
                ),
                child: SizedBox(
                  width: _sizeConfig.screenW,
                  child: Row(children: [
                    SizedBox(
                      width: _sizeConfig.safeBlockW * 60,
                      height: 55,
                      child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: ColorManager.darkBlue,
                            filled: true,
                            hintText: 'Write a comment...',
                            hintStyle:
                                TextStyle(color: ColorManager.formTextColor),
                            suffixIconConstraints: const BoxConstraints(
                                minHeight: 19, minWidth: 19),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SvgPicture.asset(
                                SvgAsset.sendRight,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: ColorManager.darkBlue,
                      radius: 45 / 2,
                      child: Center(
                        child: SvgPicture.asset(
                          SvgAsset.volumeOff,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: ColorManager.darkBlue,
                      radius: 45 / 2,
                      child: Center(
                        child: SvgPicture.asset(
                          SvgAsset.share,
                        ),
                      ),
                    )
                  ]),
                ),
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
      child: Padding(
        padding: EdgeInsets.only(left: horizontalPadding),
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
      ));
}
