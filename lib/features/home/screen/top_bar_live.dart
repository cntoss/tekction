import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../../utils/asset_manager.dart';
import '../widget/live_info.dart';
import '../widget/primary_button.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
    required this.showLiveInfo,
    this.showGlass = false,
    this.showReport = false,
    required this.onBackPressed,
    this.onBuyPressed,
  });

  /// Live info.
  final bool showLiveInfo;
  final bool showGlass;
  final bool showReport;

  final VoidCallback onBackPressed;
  final VoidCallback? onBuyPressed;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 16, top: 80, bottom: 32, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: widget.onBackPressed,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage('https://picsum.photos/300/300'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'jackyoung',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  PrimaryButton(
                    label: 'Follow',
                  ),
                ],
              )
            ],
          ),
          widget.showLiveInfo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        LiveInfo(
                          iconData: Icons.timer,
                          text: '45.02',
                        ),
                        SizedBox(width: 13),
                        LiveInfo(
                          iconData: Icons.remove_red_eye,
                          text: '6.5K',
                        ),
                      ],
                    ),
                    if (widget.showReport) const SizedBox(height: 15),
                    if (widget.showReport)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                              size: 22,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Report',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.showGlass)
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              color: ColorManager.darkBlue,
                              child: Column(children: [
                                const SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'NPR 1000 ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageAssets.sunGlass,
                                  fit: BoxFit.fitWidth,
                                ),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: widget.onBuyPressed,
                            child: Container(
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: ColorManager.purple,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                  child: Text(
                                'Buy',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              )),
                            ),
                          )
                        ],
                      )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
