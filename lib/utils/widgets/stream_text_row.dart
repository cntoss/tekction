import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class StreamTextRow extends StatelessWidget {
  StreamTextRow({super.key, this.onSendPressed, this.commentController});

  /// Callback when send button is pressed
  final VoidCallback? onSendPressed;

  /// Comment controller.
  final TextEditingController? commentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        30,
        0,
        30,
        10,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 60,
              height: 55,
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  fillColor: ColorManager.appColor,
                  filled: true,
                  hintText: 'Write a comment...',
                  hintStyle: TextStyle(color: ColorManager.bgGray2),
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 19, minWidth: 19),
                  suffixIcon: GestureDetector(
                    onTap: onSendPressed,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset(
                        AssetsPath.sendRight,
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
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: ColorManager.appColor,
            radius: 45 / 2,
            child: Center(
              child: SvgPicture.asset(
                AssetsPath.muteIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: ColorManager.appColor,
            radius: 45 / 2,
            child: Center(
              child: SvgPicture.asset(
                AssetsPath.shareLiveIcon,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
