import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:preferences/preferences.dart';

class CustomActionDialog extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? buttonText;
  final VoidCallback? onTap;

  const CustomActionDialog(
    this.title,
    this.desc,
    this.buttonText,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.all(56.0),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 27, right: 27, top: 16, bottom: 12),
                  child: Visibility(
                    visible: title == "" ? false : true,
                    child: Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: ColorManager.appColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28, right: 28, bottom: 28),
                  child: Visibility(
                    visible: desc == "" ? false : true,
                    child: Text(
                      desc ?? "",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: ColorManager.appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43, right: 43, bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 217,
                            height: 45,
                            child: ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ColorManager.activeIcon,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              onPressed: onTap,
                              child: Text(buttonText ?? "",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                          color: ColorManager.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 43, right: 43, bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 217,
                            height: 45,
                            child: ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ColorManager.gray,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: Text("Cancel",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                          color: ColorManager.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
