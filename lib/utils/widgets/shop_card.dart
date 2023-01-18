import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import 'icon_button_circle.dart';
import 'social_button.dart';

typedef ProductDeleteCardCallback = void Function(int index);
typedef ProductAddCardCallback = void Function(int index);
typedef ProductReduceCardCallback = void Function(int index);
Widget? _errorWidget;

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key? key,
    required this.itemProduct,
    required this.onTapDelete,
    required this.onTapAdd,
    required this.onTapReduce,
    required this.index,
    this.padding,
  }) : super(key: key);
  final int index;
  final CartDetailsItem itemProduct;
  final bool? padding;
  final ProductDeleteCardCallback? onTapDelete;
  final ProductAddCardCallback? onTapAdd;
  final ProductReduceCardCallback? onTapReduce;

  @override
  Widget build(BuildContext context) {
    final Widget coverImage;
    if (itemProduct.product!.img != null) {
      coverImage = CachedNetworkImage(
        imageUrl: itemProduct.product!.img!,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 250),
        fadeOutDuration: const Duration(milliseconds: 250),
        width: 126,
        height: 126,
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const SizedBox(width: 26),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: coverImage,
          ),
          const SizedBox(width: 26),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${itemProduct.product!.label ?? ""} ${itemProduct.size!.name ?? ""}",
                  style: ThemeData().textTheme.headline1!.copyWith(
                      color: ColorManager.appColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  itemProduct.product!.brand ?? "",
                  style: ThemeData().textTheme.headline1!.copyWith(
                      color: ColorManager.subGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${itemProduct.product!.currency} ${itemProduct.product!.price! * itemProduct.qte!}',
                  style: ThemeData().textTheme.headline1!.copyWith(
                        color: ColorManager.appColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: SocialButton(
                        icon: AssetsPath.iconRemove,
                        onPressed: () {
                          if (itemProduct.stock!.qte! > 1) {
                            onTapReduce!.call(index);
                          }
                        },
                      ), /* SocialButton(
                        icon: AssetsPath.iconRemove,
                        onPressed: () {
                          if (itemProduct.stock!.qte! > 1) {
                            onTapReduce!.call(index);
                          }
                        },
                      ), */
                    ),
                    const SizedBox(width: 14),
                    Text(
                      itemProduct.qte.toString(),
                      style: ThemeData().textTheme.titleMedium?.copyWith(
                          color: ColorManager.appColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const SizedBox(width: 14),
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: SocialButton(
                        icon: AssetsPath.iconAdd,
                        onPressed: () => onTapAdd!(index),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: IconButtonCircle(
                          padding: 8,
                          bgColor: ColorManager.pink,
                          icon: AssetsPath.iconDelete,
                          onPressed: () => onTapDelete!(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
