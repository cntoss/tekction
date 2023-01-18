import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../utils/widgets/custom_scaffold_view.dart';
import '../../utils/widgets/sub_title_text.dart';

class SuccessfulPaymentScreen extends StatefulWidget {
  const SuccessfulPaymentScreen({super.key});

  @override
  State<SuccessfulPaymentScreen> createState() =>
      _SuccessfulPaymentScreenState();
}

class _SuccessfulPaymentScreenState extends State<SuccessfulPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.popUntilRoot();
        context.router.pop();
        return true;
      },
      child: SafeArea(
        child: CustomScaffoldView(
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(35),
                    //iconSuccessfullyResetPasswordDark
                    child: SvgPicture.asset(
                      AssetsPath.getIconSuccessfullyResetPassword(context),
                      fit: BoxFit.contain,
                    )),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: SubTitleText('Congratulations!!!',
                      align: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          fontSize: Dimens.sp20,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: SubTitleText(
                      'Your order has been placed successfully, you can view status in your order history',
                      maxLine: 5,
                      align: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.disabled,
                        };
                        if (states.any(interactiveStates.contains)) {
                          return ColorManager.disableBtn;
                        }
                        return Colors.white;
                      }),
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 18,
                        );
                      }),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Go back',
                        style: ThemeData().textTheme.headline1?.copyWith(
                              color: ColorManager.appColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    onPressed: () {
                      context.router.popUntilRoot();
                      context.router.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
