import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ArrowButton extends StatefulWidget {
  final Color? color;
  const ArrowButton({Key? key, this.color}) : super(key: key);

  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: widget.color ?? StaticColors.nextBg,
      ),
      child: SvgPicture.asset(
        AssetsPath.iconNext,
        color: StaticColors.blue4,
      ),
    );
  }
}
