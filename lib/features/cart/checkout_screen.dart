import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import '../../utils/widgets/basic_scaffold_view.dart';
import 'checkout_page_widgets.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.list});

  final List<CartDetailsItem> list;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool showShipping = false;
  List<CartDetailsItem> listBoth = [];
  List<CartDetailsItem> listPickUp = [];
  List<CartDetailsItem> listDelivery = [];

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() {
    for (var element in widget.list) {
      if (element.product!.collect! && element.product!.shipping!) {
        listBoth.add(element);
      } else if (element.product!.collect!) {
        listPickUp.add(element);
      } else {
        listDelivery.add(element);
      }
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var element in widget.list) {
      total += (element.price! * element.qte!);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.appColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: AppBar(
            leading: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            elevation: 0,
            title: Text(
              'Checkout',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: BasicScaffoldView(
        bodyWidget: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                showBoth(showShipping, listBoth),
                // const SizedBox(height: 16),
                // showDelivery(listDelivery),
                // const SizedBox(height: 16),
                // showPickUp(listPickUp),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products price',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                          color: StaticColors.subGray,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      '${widget.list.first.product!.currency!} ${getTotalPrice()}',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: StaticColors.appColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery fees',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: StaticColors.subGray,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                    ),
                    Text(
                      'NPR 100',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: StaticColors.appColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: StaticColors.subGray,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                    ),
                    Text(
                      'NPR 245.55',
                      style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: StaticColors.appColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom().copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.disabled,
              };
              if (states.any(interactiveStates.contains)) {
                return StaticColors.disableBtn;
              }
              return StaticColors.activeIcon;
            }),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
              return const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 18,
              );
            }),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Payment',
                  style: ThemeData().textTheme.headline1?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(width: 16),
                SvgPicture.asset(
                  AssetsPath.seeMoreIcon,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          onPressed: () {
            context.router.pushNamed(AppRoutes.paymentPath);
          },
        ),
      ),
    );
  }
}
