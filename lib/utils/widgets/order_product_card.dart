import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({
    Key? key,
    required this.itemProduct,
    this.padding,
  }) : super(key: key);

  final CartDetailsItem itemProduct;
  final bool? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: itemProduct.product!.img!,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 250),
              fadeOutDuration: const Duration(milliseconds: 250),
              width: 45,
              height: 45,
              errorWidget: (_, __, ___) {
                return Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 24,
                    color: Theme.of(context).errorColor,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${itemProduct.product!.label ?? ""} ${itemProduct.size!.name ?? ""} x${itemProduct.qte!}",
                  style: ThemeData().textTheme.headline1?.copyWith(
                        color: StaticColors.appColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  itemProduct.product!.brand ?? "",
                  style: ThemeData().textTheme.headline1?.copyWith(
                        color: StaticColors.subGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          Text(
            '${itemProduct.product!.currency ?? ""} ${itemProduct.product!.price! * itemProduct.qte!}',
            style: ThemeData().textTheme.headline1?.copyWith(
                  color: StaticColors.subGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}