part of 'details_product_page.dart';

mixin _DetailsProductWidgets on _DetailsProductProps {
  void showBottomSheetBuyNowStep1(
    BuildContext context,
    StockItem stockItem,
    ItemAddress? addresse,
    ItemProduct productElement,
    List<ItemAddress> listAddress,
    VoidCallback addToCartAction,
    Function(int type, int qte) buyAction,
  ) {
    showModalBottomSheet<void>(
        barrierColor: Colors.transparent,
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (BuildContext _) {
          int qte = 1;
          int type = productElement.shipping! ? 0 : 1;
          return StatefulBuilder(
            builder: (BuildContext _, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 35,
                    margin: const EdgeInsets.only(top: 8, bottom: 28),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 36,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                rawImage /* GetIt.I<GlobalConfiguration>().getValue(
                                ConstGlobalConfiguration.baseUrlMedia) +
                                productElement.img! */
                            ,
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(milliseconds: 250),
                            fadeOutDuration: const Duration(milliseconds: 250),
                            width: 86,
                            height: 86,
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
                          width: 26,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                productElement.label ?? "",
                                style: ThemeData()
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: StaticColors.appColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                productElement.brand ?? "",
                                style: ThemeData()
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: StaticColors.subGray,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rs. ${productElement.price!}',
                                    style: ThemeData()
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: StaticColors.appColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (qte > 1) {
                                            setState(() => qte--);
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              border: Border.all(
                                                  color: StaticColors.black5,
                                                  width: 1)),
                                          child: SvgPicture.asset(
                                            AssetsPath.iconRemove,
                                            width: 6.46,
                                            height: 1.01,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        qte.toString(),
                                        style: ThemeData()
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: StaticColors.appColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (stockItem.qte! > qte) {
                                            setState(() => qte++);
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              border: Border.all(
                                                  color: StaticColors.black5,
                                                  width: 1)),
                                          child: SvgPicture.asset(
                                            AssetsPath.iconAdd,
                                            width: 5.91,
                                            height: 6.12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: productElement.shipping!,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 36),
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
                            onTap: () {
                              setState(() => type = 0);
                            },
                            title: Text(
                              'Current delivery',
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: StaticColors.appColor),
                            ),
                            trailing: SvgPicture.asset(
                              AssetsPath.check,
                              color: type == 0 ? null : StaticColors.gray5,
                            ),
                          ),
                          Visibility(
                            visible: type == 0,
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
                                  onTap: () {
                                    showBottomSheetAddress(
                                      context,
                                      () {},
                                      (item) {
                                        /*  context.read<DetailsProductCubit>().selectAddressOrder(item.id ?? "");
                                        context.read<DetailsProductCubit>().getAddress();
                                        context.router.popForced();
                                        setState((){
                                          addresse=item;
                                        }); */
                                      },
                                    );
                                  },
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
                                    (addresse != null)
                                        ? addresse.name!
                                        : 'Delivery Address',
                                    maxLines: 2,
                                    style: (addresse != null)
                                        ? ThemeData()
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: StaticColors.subGray)
                                        : ThemeData()
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: StaticColors.appColor),
                                  ),
                                  subtitle: (addresse != null)
                                      ? Text(
                                          addresse.description!,
                                          maxLines: 2,
                                          style: ThemeData()
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                  color: StaticColors.appColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                        )
                                      : null,
                                  trailing: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      color: StaticColors.nextBg,
                                    ),
                                    child: SvgPicture.asset(
                                      AssetsPath.iconNext,
                                      color: StaticColors.blue4,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Visibility(
                    visible: productElement.collect!,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 36),
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
                            onTap: () {
                              //   context.read<DetailsProductCubit>().selectAddressOrder(productElement.addressId!);
                              setState(() => type = 1);
                            },
                            title: Text(
                              'Pickup Address',
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: StaticColors.appColor),
                            ),
                            trailing: SvgPicture.asset(
                              AssetsPath.check,
                              color: type == 1 ? null : StaticColors.gray5,
                            ),
                          ),
                          Visibility(
                            visible: type == 1,
                            child: Column(
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
                                        shape: BoxShape.circle,
                                        color: StaticColors.bgColor),
                                    child: SvgPicture.asset(AssetsPath.pin),
                                  ),
                                  title: Text(
                                    productElement.address!.name!,
                                    style: ThemeData()
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: StaticColors.subGray),
                                  ),
                                  subtitle: Text(
                                    productElement.address!.description!,
                                    style: ThemeData()
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            color: StaticColors.appColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
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
                              "Rs. ${(productElement.price! * qte)}",
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery fee',
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              ((type == 0) ? " Rs 100" : "Rs 0 "),
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              'Rs ${productElement.price! * qte}',
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.disabled,
                        };
                        return StaticColors.activeIcon;
                      }),
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Payment',
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
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
                    ),
                    onPressed: (type == 0 && addresse == null)
                        ? null
                        : () {
                            buyAction.call(type, qte);
                          },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showBottomSheetAddress(
      BuildContext context,
      VoidCallback addAddresseAction,
      Function(ItemAddress itemAddress) selectAddressAction) {
    showModalBottomSheet<void>(
        context: context,
        enableDrag: true,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        builder: (BuildContext _) {
          return StatefulBuilder(
            builder: (BuildContext _, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 35,
                    margin: const EdgeInsets.only(top: 8, bottom: 28),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      "Delivery Address",
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  //TODO: uncommit this
                  /*  AddresseListView(
                    onItemTapped: (ItemAddress eShow) {
                      selectAddressAction.call(eShow);
                    },
                    status: StateStatus.loaded,
                    listItemAddresse: context.read<DetailsProductCubit>().state.listAddresse!,
                    onTapEdit: (ItemAddress eShow) {
                      /* BlocProvider.of<RouteCubit>(context)
                          .navigateRouteNamedWithCallback(
                        AutoRouteModel(
                            path: AppRoutes.addAddressLivePagePath,
                            data: {
                              'pickUp': false,
                              'itemAddresses': eShow,
                            }),
                            (call) {
                          context.read<DetailsProductCubit>().selectAddressOrder(eShow.id!);
                          selectAddressAction.call(call as ItemAddress);
                        },
                      ); */
                    },
                  ), */
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.disabled,
                        };
                        return StaticColors.appColor;
                      }),
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Add Address',
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
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
                    ),
                    onPressed: () {
                      /*   BlocProvider.of<RouteCubit>(context)
                          .navigateRouteNamedWithCallback(
                        const AutoRouteModel(
                            path: AppRoutes.addAddressLivePagePath,
                            data: {
                              'pickUp': false,
                              'itemAddresses': ItemAddress(),
                            }),
                            (call) {
                          selectAddressAction.call(call as ItemAddress);
                          context.read<DetailsProductCubit>().selectAddressOrder(call.id!);
                        },
                      ); */
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showBottomSheetBuyNowStep2(
      //UserEntity userEntity,
      int qte,
      int type,
      BuildContext context,
      ItemProduct productElement,
      Function(int index) buyAction) {
    showModalBottomSheet<void>(
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (BuildContext _) {
          int index = 0;
          return StatefulBuilder(
            builder: (BuildContext _, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 35,
                    margin: const EdgeInsets.only(top: 8, bottom: 28),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Payment',
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        // context.read<DetailsProductCubit>().selectPaymentOrder(1);
                        setState(() => index = 0);
                      },
                      title: Text(
                        "Credit card",
                        style: ThemeData().textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: StaticColors.titleColor),
                      ),
                      trailing: SvgPicture.asset(
                        AssetsPath.check,
                        color: index == 0 ? null : StaticColors.gray5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        /*  context.read<DetailsProductCubit>().selectPaymentOrder(1);
                        setState(() => index = 1); */
                      },
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'My wallet',
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: StaticColors.appColor),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: StaticColors.nextBg,
                            ),
                            child: Text(
                              '20.0'
                              " "
                              '\$',

                              //doubleToStringCurrency(userEntity.wallet!)+ " " +userEntity.symbole!,
                              style: ThemeData().textTheme.headline4?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: StaticColors.appColor),
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                        AssetsPath.check,
                        color: index == 1 ? null : StaticColors.gray5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        /*   context.read<DetailsProductCubit>().selectPaymentOrder(0);
                        setState(() => index = 2); */
                      },
                      title: Text(
                        'Cash on delivery',
                        style: ThemeData().textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: StaticColors.appColor),
                      ),
                      trailing: SvgPicture.asset(
                        AssetsPath.check,
                        color: index == 2 ? null : StaticColors.gray5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
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
                              "Rs ${productElement.price! * qte}",
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery fees',
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              ((type == 0) ? "Rs 100 " : "Rs 0 "),
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              'Rs ${productElement.price! * qte}',
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.disabled,
                        };
                        return StaticColors.activeIcon;
                      }),
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Payment",
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
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
                    ),
                    onPressed: () {
                      buyAction.call(index);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showBottomSheetBuyNowStep3(
      BuildContext context, VoidCallback buyAction) {
    showModalBottomSheet<void>(
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: StaticColors.appColor,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 31,
                ),
                Center(
                  child: SvgPicture.asset(
                    AssetsPath.iconSuccessfullyResetPassword,
                    height: 115,
                    width: 115,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "Congratulations!!!",
                    style: ThemeData().textTheme.headline1?.copyWith(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "Order placed successfully",
                      textAlign: TextAlign.center,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      const Set<MaterialState> interactiveStates =
                          <MaterialState>{
                        MaterialState.disabled,
                      };
                      return StaticColors.activeIcon;
                    }),
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 50);
                    }),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Go back',
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  onPressed: buyAction,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          );
        });
  }
}
