import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextAlign? align;

  const SubTitleText(
    this.text, {
    Key? key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _baseStyle = Theme.of(context).textTheme.subtitle1!.copyWith(
        color: Colors.white,
        fontSize: Dimens.sp20,
        fontWeight: FontWeight.w700);

    return Text(
      text,
      style: style ?? _baseStyle.merge(style),
      maxLines: maxLine ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: align,
    );
  }
}
