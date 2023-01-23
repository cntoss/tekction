import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({
    Key? key,
    required this.itemProduct,
    this.padding,
  }) : super(key: key);

  final ProductElement itemProduct;
  final bool? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 24,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl:
                  rawImage /*  GetIt.I<GlobalConfiguration>()
                      .getValue(ConstGlobalConfiguration.baseUrlMedia) +
                  itemProduct.product!.img! */
              ,
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
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${itemProduct.product!.label ?? ""} x${itemProduct.qte!}",
                  style: ThemeData().textTheme.headline1?.copyWith(
                        color: ColorManager.appColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  itemProduct.product!.brand ?? "",
                  style: ThemeData().textTheme.headline1?.copyWith(
                        color: ColorManager.subGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Rs ${itemProduct.product!.price! * itemProduct.qte!}',
            style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.subGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
