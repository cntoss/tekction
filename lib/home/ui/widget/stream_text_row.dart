import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/app_constant.dart';
import '../../../resource/asset_manager.dart';
import '../../../resource/color_manager.dart';
import '../../../service/locator.dart';

class StreamTextRow extends StatelessWidget {
  StreamTextRow({super.key, this.onSendPressed, this.commentController});
  final _sizeConfig = locator<SizeConfig>();

  /// Callback when send button is pressed
  final VoidCallback? onSendPressed;

  /// Comment controller.
  final TextEditingController? commentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        horizontalPadding,
        0,
        horizontalPadding,
        10,
      ),
      child: SizedBox(
        width: _sizeConfig.screenW,
        child: Row(children: [
          SizedBox(
            width: _sizeConfig.safeBlockW * 56,
            height: 55,
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                fillColor: ColorManager.darkBlue,
                filled: true,
                hintText: 'Write a comment...',
                hintStyle: TextStyle(color: ColorManager.formTextColor),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 19, minWidth: 19),
                suffixIcon: GestureDetector(
                  onTap: onSendPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      SvgAsset.sendRight,
                    ),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
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
    );
  }
}
