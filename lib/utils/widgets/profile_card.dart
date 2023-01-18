import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.trailing,
    this.leadingIcon,
    this.padding,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget trailing;
  final String? leadingIcon;
  final double? padding;

  @override
  _ProfileCard createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 8,
          left: widget.padding ?? 35,
          right: widget.padding ?? 35,
          bottom: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: ListTile(
          onTap: widget.onPressed,
          leading: widget.leadingIcon != null
              ? Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: ColorManager.bgColor),
                  child: SvgPicture.asset(
                    widget.leadingIcon ?? "",
                    color: (widget.leadingIcon == AssetsPath.iconNotification)
                        ? ColorManager.purple
                        : null,
                  ),
                )
              : null,
          title: Text(
            widget.text,
            style: ThemeData().textTheme.headline1?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: ColorManager.titleColor),
          ),
          trailing: widget.trailing),
    );
  }
}
