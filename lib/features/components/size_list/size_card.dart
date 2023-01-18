import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../../data/model/mode.dart';

typedef SizeCardCallback = void Function(StockItem eShow);

class SizeCard extends StatelessWidget {
  const SizeCard({
    Key? key,
    required this.sizeItem,
    required this.onTap,
  }) : super(key: key);

  final StockItem sizeItem;
  final SizeCardCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(sizeItem) : null,
      child: Container(
        height: 39,
        width: 39,
        margin: const EdgeInsets.only(left: 18),
        decoration: BoxDecoration(
            color: sizeItem.qte == 0
                ? ColorManager.black5
                : (sizeItem.select! ? ColorManager.purple : ColorManager.white),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: ColorManager.black5, width: 1)),
        child: Center(
          child: Text(
            sizeItem.size!.name ?? "",
            style: ThemeData().textTheme.headline1?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: sizeItem.qte == 0
                      ? ColorManager.white
                      : (sizeItem.select!
                          ? ColorManager.white
                          : ColorManager.appColor),
                ),
          ),
        ),
      ),
    );
  }
}
