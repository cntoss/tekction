import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';

typedef ProductCardCallback = void Function(ItemProduct eShow);
Widget? _errorWidget;

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemSubMenuHome,
    required this.onTap,
    required this.userId,
    this.padding,
  }) : super(key: key);

  final ItemProduct itemSubMenuHome;
  final bool? padding;
  final ProductCardCallback? onTap;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final Widget coverImage;
    if (itemSubMenuHome.img != null) {
      coverImage = CachedNetworkImage(
        imageUrl: itemSubMenuHome.img!,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 250),
        fadeOutDuration: const Duration(milliseconds: 250),
        width: 173,
        height: 166,
        errorWidget: (_, __, ___) {
          return _errorWidget ??= Center(
            child: Icon(
              Icons.error_outline,
              size: 24,
              color: Theme.of(context).errorColor,
            ),
          );
        },
      );
    } else {
      coverImage = _errorWidget ??= Center(
        child: Icon(
          Icons.error_outline,
          size: 24,
          color: Theme.of(context).errorColor,
        ),
      );
    }

    return GestureDetector(
      onTap: onTap != null ? () => onTap!(itemSubMenuHome) : null,
      child: Container(
        margin: const EdgeInsets.only(left: 18),
        decoration: BoxDecoration(
          color: StaticColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: coverImage,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(height: 166),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 18),
              child: Text(
                itemSubMenuHome.label ?? "",
                maxLines: 1,
                style: ThemeData().textTheme.headline1?.copyWith(
                      color: StaticColors.appColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 0, left: 18),
              child: Text(
                '${itemSubMenuHome.price!} ${itemSubMenuHome.currency!}',
                style: ThemeData().textTheme.headline1?.copyWith(
                      color: StaticColors.priceGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
