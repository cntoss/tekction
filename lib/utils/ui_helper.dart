import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

final SizeConfig _sizeConfig = locator<SizeConfig>();

class UiHelper {
  //*Preset heights and width for gapings
  final SizedBox extraSmallHeight = SizedBox(
    height: _sizeConfig.blockSizeW,
  );
  final SizedBox smallHeight = SizedBox(
    height: _sizeConfig.blockSizeH * 1.5,
  );
  final SizedBox mediumHeight = SizedBox(
    height: _sizeConfig.blockSizeH * 5,
  );
  final SizedBox smallWidth = SizedBox(
    width: _sizeConfig.blockSizeW * 1.5,
  );
  //*Preset heights and width for gapings

  //*Showing App Toast
  showToast(
      {required String msg, bool length = true, bool gravityBottom = true}) {
    Fluttertoast.showToast(
      toastLength: length
          ? Toast.LENGTH_SHORT
          : Toast.LENGTH_LONG, //true for short || false for long
      msg: msg,
      gravity: gravityBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      backgroundColor: const Color(0xFFcd2273),
    );
  }
  //*Showing App Toast

  Widget loaderWidget = Center(
    child: SizedBox(
      height: _sizeConfig.blockSizeW * 10,
      width: _sizeConfig.blockSizeW * 10,
      child: const CircularProgressIndicator(),
    ),
  );

  showLoader(context) {
    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget fullLoader = Stack(
    children: [
      Opacity(
        opacity: 0.6,
        child: Container(
          color: Colors.black,
          height: _sizeConfig.screenH,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: _sizeConfig.blockSizeW * 10,
          width: _sizeConfig.blockSizeW * 10,
          child: const CircularProgressIndicator(),
        ),
      ),
    ],
  );
  PreferredSize appBar(BuildContext context, {required String title}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: AppBar(
          leading: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
          ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  //*Hiding keyboard
  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
