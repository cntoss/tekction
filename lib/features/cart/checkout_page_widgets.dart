import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import '../../utils/widgets/order_product_card.dart';

Widget showPickUp(List<CartDetailsItem> listPickUp) {
  return Visibility(
    visible: listPickUp.isNotEmpty,
    child: Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listPickUp.length,
          itemBuilder: (context, index) {
            return OrderProductCard(
              itemProduct: listPickUp[index],
            );
          },
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              width: 1,
              color: StaticColors.borderGray,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Pickup address',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: StaticColors.appColor),
                ),
              ),
              Column(
                children: [
                  const Divider(
                    height: 1,
                    color: StaticColors.borderGray,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: Container(
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: StaticColors.bgColor),
                      child: SvgPicture.asset(AssetsPath.pin),
                    ),
                    title: Text(
                      listPickUp.first.product!.address!.name!,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: StaticColors.subGray),
                    ),
                    subtitle: Text(
                      listPickUp.first.product!.address!.description!,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget showDelivery(List<CartDetailsItem> listDelivery) {
  return Visibility(
    visible: listDelivery.isNotEmpty,
    child: Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listDelivery.length,
          itemBuilder: (context, index) {
            return OrderProductCard(
              itemProduct: listDelivery[index],
            );
          },
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              width: 1,
              color: StaticColors.borderGray,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Delivery',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: StaticColors.appColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(
                    height: 1,
                    color: StaticColors.borderGray,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    onTap: () async {},
                    leading: Container(
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: StaticColors.bgColor),
                      child: SvgPicture.asset(AssetsPath.pin),
                    ),
                    title: Text(
                      'Delivery address',
                      maxLines: 2,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: StaticColors.subGray),
                    ),
                    subtitle: Text(
                      "Delivery address",
                      maxLines: 2,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: StaticColors.nextBg,
                      ),
                      child: SvgPicture.asset(
                        AssetsPath.iconNext,
                        color: StaticColors.blue4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget showBoth(bool showShipping, List<CartDetailsItem> listBoth) {
  return Visibility(
    visible: listBoth.isNotEmpty,
    child: Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listBoth.length,
          itemBuilder: (context, index) {
            return OrderProductCard(
              itemProduct: listBoth[index],
            );
          },
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              width: 1,
              color: StaticColors.borderGray,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  'Delivery',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: StaticColors.appColor),
                ),
                trailing: SvgPicture.asset(
                  AssetsPath.check,
                  color: showShipping ? null : StaticColors.gray5,
                ),
              ),
              Visibility(
                visible: showShipping,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Divider(
                      height: 1,
                      color: StaticColors.borderGray,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ListTile(
                      onTap: () async {},
                      leading: Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: StaticColors.bgColor),
                        child: SvgPicture.asset(AssetsPath.pin),
                      ),
                      title: Text(
                        '123, sample address.',
                        maxLines: 2,
                        style: ThemeData().textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: StaticColors.appColor),
                      ),
                      subtitle: Text(
                        'description',
                        maxLines: 2,
                        style: ThemeData().textTheme.headline1?.copyWith(
                            color: StaticColors.appColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: StaticColors.nextBg,
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.iconNext,
                          color: StaticColors.blue4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(
              width: 1,
              color: StaticColors.borderGray,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  'Pickup address',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: StaticColors.appColor),
                ),
                trailing: SvgPicture.asset(AssetsPath.check,
                    color: !showShipping ? null : StaticColors.gray5),
              ),
              Visibility(
                visible: !showShipping,
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      color: StaticColors.borderGray,
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: Container(
                        height: 44,
                        width: 44,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: StaticColors.bgColor),
                        child: SvgPicture.asset(AssetsPath.pin),
                      ),
                      title: Text(
                        listBoth.first.product!.address!.name!,
                        style: ThemeData().textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: StaticColors.subGray),
                      ),
                      subtitle: Text(
                        listBoth.first.product!.address!.description!,
                        style: ThemeData().textTheme.headline1?.copyWith(
                            color: StaticColors.appColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
