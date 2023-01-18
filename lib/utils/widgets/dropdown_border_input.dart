import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class DropdownBorderInput extends StatelessWidget {
  final ValueChanged<dynamic> onChange;
  final dynamic value;
  final String? hint;
  final String? icon;
  final List<DropdownMenuItem<dynamic>> customItems;

  const DropdownBorderInput({
    Key? key,
    required this.onChange,
    required this.value,
    this.hint,
    this.icon,
    required this.customItems,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.borderGray, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: DropdownButton(
        icon: SvgPicture.asset(AssetsPath.dropdown),
        value: value,
        isExpanded: true,
        underline: Container(),
        hint: Text(
          hint ?? '',
          style: ThemeData().textTheme.headline1?.copyWith(
                color: ColorManager.descColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: onChange,
        items: customItems,
      ),
    );
  }
}
