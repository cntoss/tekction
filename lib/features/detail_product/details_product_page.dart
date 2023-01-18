import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';

import '../../utils/widgets/molecules/custom_auto_back.dart';
import '../components/size_list/size_list_view.dart';

part 'details_product_page_props.dart';
part 'details_product_page_widgets.dart';

class DetailsProductPage extends StatefulWidget {
  const DetailsProductPage({Key? key, required this.product}) : super(key: key);
  final ItemProduct product;

  @override
  _DetailsProductState createState() => _DetailsProductState();
}

class _DetailsProductState extends _DetailsProductProps
    with _DetailsProductWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: rawImage,
                      fit: BoxFit.cover,
                      width: 414,
                      height: qte == 0 ? 450 : 520,
                      fadeInDuration: const Duration(milliseconds: 250),
                      fadeOutDuration: const Duration(milliseconds: 250),
                      errorWidget: (_, __, ___) {
                        return const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 480,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            ColorManager.gradientBlack1,
                            ColorManager.gradientBlack2
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 52, left: 22),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: AutoBackCustom(),
                    ),
                  ),
                  Visibility(
                    visible: qte == 0,
                    child: Positioned(
                      top: 430,
                      right: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom().copyWith(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return ColorManager.errorOutOfStock;
                          }),
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>((Set<MaterialState> states) {
                            return const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20);
                          }),
                        ),
                        onPressed: null,
                        child: Text(
                          'Out of stock',
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: ColorManager.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 43),
              child: Text(
                widget.product.brand ?? "",
                style: ThemeData().textTheme.headline1?.copyWith(
                    color: ColorManager.appColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 43),
              child: Text(
                widget.product.label ?? "",
                style: ThemeData().textTheme.headline1?.copyWith(
                    color: ColorManager.appColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 43),
              child: Text(
                'Rs. ${widget.product.price!}',
                style: ThemeData().textTheme.headline1?.copyWith(
                    color: ColorManager.appColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            SizeLivelListView(
              list: widget.product.stocks ?? [],
              onItemTapped: (StockItem eShow) {
                //context.read<DetailsProductCubit>().selectStock(eShow);
                selectSize(eShow);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23, left: 43),
              child: Text(
                widget.product.description ?? "",
                style: ThemeData().textTheme.headline1?.copyWith(
                    color: ColorManager.subGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return ColorManager.appColor;
                        }),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry>((Set<MaterialState> states) {
                          return const EdgeInsets.symmetric(
                            vertical: 16,
                          );
                        }),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Add to cart",
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      onPressed: () {
                        /*  if (state.stockItem!.qte != 0) {
                          if (checkCart(
                              state.cartDetailsList!, widget.product)) {
                            context
                                .read<DetailsProductCubit>()
                                .addToCart(widget.product, context);
                          } else {
                            //TODO show error
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => CustomAlertDialog(
                                "",
                                S.current.empty_your_cart_to_add_products,
                              ),
                            );
                          }
                        } else {
                          GetIt.I<BaseScreenMessenger>().showSnackBar(
                              context: context,
                              message: S.current.out_of_stock);
                        } */
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return ColorManager.activeIcon;
                        }),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry>((Set<MaterialState> states) {
                          return const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 30);
                        }),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Buy",
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            AssetsPath.seeMoreIcon,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        /*  if (state.stockItem!.qte != 0) {
                          (state.listAddresse!.isNotEmpty)
                              ? context
                                  .read<DetailsProductCubit>()
                                  .selectAddressOrder(
                                      state.listAddresse!.first.id!)
                              : () {};
                          showBottomSheetBuyNowStep1(
                            context,
                            state.stockItem!,
                            context
                                    .read<DetailsProductCubit>()
                                    .state
                                    .listAddresse!
                                    .isNotEmpty
                                ? context
                                    .read<DetailsProductCubit>()
                                    .state
                                    .listAddresse!
                                    .first
                                : null,
                            widget.product,
                            state.listAddresse!,
                            () {},
                            (int type, int qte) {
                              context.router.popForced();
                              context
                                  .read<DetailsProductCubit>()
                                  .selectCollectOrder(type);
                              context
                                  .read<DetailsProductCubit>()
                                  .selectPriceOrder(
                                      widget.product.price!,
                                      (widget.product.price! * qte),
                                      qte,
                                      widget.product.id!);
                              showBottomSheetBuyNowStep2(
                                state.userEntity!,
                                qte,
                                type,
                                context,
                                widget.product,
                                (int index) {
                                  switch (index) {
                                    case 0:
                                      context
                                          .read<DetailsProductCubit>()
                                          .getPaymentUrl(state.userEntity!);
                                      break;
                                    case 1:
                                      if (state.userEntity!.wallet! >=
                                          (widget.product.price! * qte)) {
                                        context.router.popForced();
                                        context
                                            .read<DetailsProductCubit>()
                                            .getPaymentWallet(
                                                widget.product.ownerId!);
                                      } else {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (context) =>
                                              WalletActionDialog(
                                            () => {context.router.pop()},
                                            () => {
                                              context.router.pop(),
                                              context.router.pushNamed(
                                                  AppRoutes.fundWalletPagePath),
                                            },
                                            (newPriceProd(
                                                        widget.product.price! *
                                                            qte,
                                                        widget.product
                                                            .currency!) -
                                                    state.userEntity!.wallet!)
                                                .toStringAsFixed((state
                                                            .userEntity!
                                                            .currency ==
                                                        "NPR")
                                                    ? 3
                                                    : 2),
                                          ),
                                        );
                                      }
                                      break;
                                    case 2:
                                      context.router.popForced();
                                      context
                                          .read<DetailsProductCubit>()
                                          .createOrder();
                                      break;
                                  }
                                },
                              );
                            },
                          );
                        } else {
                          GetIt.I<BaseScreenMessenger>().showSnackBar(
                              context: context,
                              message: S.current.out_of_stock);
                        } */
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
