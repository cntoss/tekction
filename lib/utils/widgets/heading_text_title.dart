import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class HeadingTextTitle extends StatelessWidget {
  final String text;

  final bool? cancelPaddingTop;
  const HeadingTextTitle(this.text, {Key? key, this.cancelPaddingTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cancelPaddingTop != null
          ? const EdgeInsets.only(bottom: 3)
          : const EdgeInsets.only(bottom: 3, top: 3),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

class HeadingTextTitleSliver extends StatelessWidget {
  final String text;

  const HeadingTextTitleSliver(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 12, bottom: 4, top: 8),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: Dimens.sp34, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
