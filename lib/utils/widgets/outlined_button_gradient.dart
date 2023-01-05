import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class OutlinedButtonGradient extends StatefulWidget {
  const OutlinedButtonGradient({
    Key? key,
    this.text,
    this.buttonStyle,
    required this.onPressed,
    this.borderSideColor,
    this.width,
    this.styleText,
    this.paddingVertical,
    this.height,
    this.gradient = const LinearGradient(
      colors: [
        StaticColors.gradient1,
        StaticColors.gradient2,
      ],
      begin: Alignment.topCenter,
      end: Alignment(0, 3),
    ),
    this.borderRadius,
    this.icon,
  }) : super(key: key);
  final String? text;
  final Color? borderSideColor;
  final double? width;
  final double? height;
  final double? paddingVertical;
  final TextStyle? styleText;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Gradient gradient;
  final String? icon;
  final ButtonStyle? buttonStyle;

  @override
  _OutlinedButtonGradient createState() => _OutlinedButtonGradient();
}

class _OutlinedButtonGradient extends State<OutlinedButtonGradient> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ??
        BorderRadius.circular(Dimens.circularRadiusBottom);
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: borderRadius,
        ),
        child: OutlinedButton(
          style: widget.buttonStyle ??
              ElevatedButton.styleFrom(
                side: BorderSide.none,
                backgroundColor: Colors.transparent,
                padding: widget.paddingVertical != null
                    ? EdgeInsets.only(
                        left: 40,
                        right: 40,
                        top: widget.paddingVertical!,
                        bottom: widget.paddingVertical!)
                    : const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        top: 2,
                        bottom: 2,
                      ),
                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                shadowColor: null,
                splashFactory: null,
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
              ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text ?? "",
                  textAlign: TextAlign.center,
                  style: widget.styleText ??
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimens.sp15,
                          color: Colors.white)),
              (widget.icon != null)
                  ? SvgPicture.asset(widget.icon!)
                  : Container(),
            ],
          ),
          onPressed: () {
            widget.onPressed.call();
          },
        ));
  }
}
