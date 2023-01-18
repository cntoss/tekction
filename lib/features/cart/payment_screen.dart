import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../utils/widgets/basic_scaffold_view.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Payment method',
                    style: ThemeData().textTheme.titleMedium?.copyWith(
                        color: ColorManager.appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
                      color: ColorManager.borderGray,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      'Credit card',
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorManager.titleColor),
                    ),
                    trailing: SvgPicture.asset(
                      AssetsPath.check,
                      color: ColorManager.borderGray,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      width: 1,
                      color: ColorManager.borderGray,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        Text(
                          'My wallet',
                          style: ThemeData().textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorManager.appColor),
                        ),
                        const SizedBox(width: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: ColorManager.nextBg,
                          ),
                          child: Text(
                            "\$ 500",
                            style: ThemeData().textTheme.headline4?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: ColorManager.appColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    trailing: SvgPicture.asset(
                      AssetsPath.check,
                      color: null,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      width: 1,
                      color: ColorManager.borderGray,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      'Cash on delivery',
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorManager.titleColor),
                    ),
                    trailing: SvgPicture.asset(
                      AssetsPath.check,
                      color: ColorManager.borderGray,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
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
                return ColorManager.disableBtn;
              }
              return ColorManager.activeIcon;
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
                  'Checkout',
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
            context.router.pushNamed(AppRoutes.successfulPaymentPath);
          },
        ),
      ),
    );
  }
}
