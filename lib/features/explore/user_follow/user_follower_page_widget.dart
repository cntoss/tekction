part of 'user_follower_page.dart';

mixin _UserFollowerPageWidgets on _UserFollowerPageProps {
  tabsProfile() {
    return <Widget>[
      Tab(
        text: "Events",
      ),
      Tab(
        text: 'Products',
      ),
    ].toList();
  }

  Widget tapTwo(BuildContext context) {
    return EmptyView(
      image: AssetsPath.emptyOrder,
      textColor: StaticColors.appColor,
      titleText: 'No products added',
      supText: "No products added",
      width: 176,
      height: 175,
      onRefresh: () {
        /*   context.read<UserFollowerCubit>().getLiveSoon(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowers(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowing(widget.user.id!);
              context.read<UserFollowerCubit>().getCurrentUser();
              context.read<UserFollowerCubit>().getAddress();
              context.read<UserFollowerCubit>().getCart(); */
      },
    );
    /*   var state = context.watch<UserFollowerCubit>().state;
    return (emptyList(state.productList))
        ? EmptyView(
            image: AssetsPath.emptyOrder,
            textColor: StaticColors.appColor,
            titleText: S.current.products_title,
            supText: S.current.products_desc,
            width: 176,
            height: 175,
            onRefresh: () {
              /*   context.read<UserFollowerCubit>().getLiveSoon(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowers(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowing(widget.user.id!);
              context.read<UserFollowerCubit>().getCurrentUser();
              context.read<UserFollowerCubit>().getAddress();
              context.read<UserFollowerCubit>().getCart(); */
            },
          )
        : FollowerProductListView(
            onItemTapped: (ItemProduct productElement) {
              //TODO: go to detail page
              BlocProvider.of<RouteCubit>(context)
                  .navigateRouteNamed(AutoRouteModel(
                path: AppRoutes.detailsProductPagePath,
                data: ItemProduct.fromJson(productElement.toJson()),
              ));
            },
            status: state.status,
            listItemProduct: state.productList ?? [],
            user: widget.user,
            onBuyTapped: (ItemProduct productElement) {
              if (productElement.qte != 0) {
                productElement.stocks!.first =
                    productElement.stocks!.first.copyWith(select: true);
                context
                    .read<UserFollowerCubit>()
                    .selectStock(productElement.stocks!.first);
                showBottomSheetBuy(
                  context,
                  widget.user,
                  productElement,
                  () {
                    if (checkCart(state.cartDetailsList!, productElement)) {
                      context
                          .read<UserFollowerCubit>()
                          .addToCart(productElement, context);
                    } else {
                      //TODO show error
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => CustomAlertDialog(
                          "",
                          S.current.empty_cart_to_add_products,
                        ),
                      );
                    }
                  },
                  () {
                    context.router.popForced();
                    (state.listAddresse!.isNotEmpty)
                        ? context
                            .read<UserFollowerCubit>()
                            .selectAddressOrder(state.listAddresse!.first.id!)
                        : () {};
                    showBottomSheetBuyNowStep1(
                      context,
                      context
                              .read<UserFollowerCubit>()
                              .state
                              .listAddresse!
                              .isNotEmpty
                          ? context
                              .read<UserFollowerCubit>()
                              .state
                              .listAddresse!
                              .first
                          : null,
                      widget.user,
                      productElement,
                      state.listAddresse!,
                      () {},
                      (int type, int qte) {
                        context.router.popForced();
                        context
                            .read<UserFollowerCubit>()
                            .selectCollectOrder(type);
                        context.read<UserFollowerCubit>().selectPriceOrder(
                            productElement.price!,
                            (productElement.price! * qte),
                            qte,
                            productElement.id!);
                        showBottomSheetBuyNowStep2(
                          widget.user,
                          state.userEntity!,
                          qte,
                          type,
                          context,
                          productElement,
                          (int index) {
                            switch (index) {
                              case 0:
                                context
                                    .read<UserFollowerCubit>()
                                    .getPaymentUrl(state.userEntity!);
                                break;
                              case 1:
                                if (state.userEntity!.wallet! >=
                                    (productElement.price! * qte)) {
                                  context.router.popForced();
                                  context
                                      .read<UserFollowerCubit>()
                                      .getPaymentWallet(
                                          productElement.ownerId!);
                                } else {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) => WalletActionDialog(
                                      () => {context.router.pop()},
                                      () => {
                                        context.router.pop(),
                                        context.router.pushNamed(
                                            AppRoutes.fundWalletPagePath),
                                      },
                                      (doubleToStringCurrency(newPriceProd(
                                              productElement.price! * qte,
                                              productElement.currency ?? "") -
                                          state.userEntity!.wallet!)),
                                    ),
                                  );
                                }
                                break;
                              case 2:
                                context.router.popForced();
                                context.read<UserFollowerCubit>().createOrder();
                                break;
                            }
                          },
                        );
                      },
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => CustomAlertDialog(
                    "",
                    S.current.out_of_stock,
                  ),
                );
              }
            },
          );
   */
  }

  Widget tapOne(BuildContext context) {
    return EmptyView(
      image: AssetsPath.emptyFollow,
      textColor: StaticColors.appColor,
      supText: "No live events scheduled",
      titleText: 'No live events scheduled',
      width: 176,
      height: 175,
      onRefresh: () {
        /* context.read<UserFollowerCubit>().getLiveSoon(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowers(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowing(widget.user.id!);
              context.read<UserFollowerCubit>().getCurrentUser();
              context.read<UserFollowerCubit>().getAddress();
              context.read<UserFollowerCubit>().getCart(); */
      },
    );
    /*   var state = context.watch<UserFollowerCubit>().state;
    return (emptyList(state.liveList))
        ? EmptyView(
            image: AssetsPath.emptyFollow,
            textColor: StaticColors.appColor,
            supText: S.current.empty_event_desc,
            titleText: S.current.empty_event_title,
            width: 176,
            height: 175,
            onRefresh: () {
              /* context.read<UserFollowerCubit>().getLiveSoon(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowers(widget.user.id!);
              context.read<UserFollowerCubit>().getFollowing(widget.user.id!);
              context.read<UserFollowerCubit>().getCurrentUser();
              context.read<UserFollowerCubit>().getAddress();
              context.read<UserFollowerCubit>().getCart(); */
            },
          )
        : CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FollowerEventListView(
                  status: state.status,
                  listItemSub: state.liveList!,
                  onTapShare: (ItemSessionsLiveDetails eShow) {
                    context.read<UserFollowerCubit>().createDynamicLink(
                        dynamicLinks, eShow.id!, widget.user.id!);
                  },
                  userId: state.userEntity!.id!,
                  onItemReservation:
                      (ItemSessionsLiveDetails eShow, int index) async {
                    if (state.userEntity != null) {
                      if (state.userEntity!.userTags != null) {
                        /*   if (!checkReservation(eShow.reservations, state.userEntity!)) {
                    context.read<UserFollowerCubit>().sendReservation(eShow.id!, index);
                  }
                  else {
                    context.read<UserFollowerCubit>().deleteReservation(index);
                  }
                  await Future.delayed(const Duration(seconds: 1), (){
                    setState(() {
                    });
                  });
                  */
                      }
                    }
                  },
                  onTapUser: (ItemSessionsLiveDetails eShow) {},
                  onItemTapped: (ItemSessionsLiveDetails eShow) {
                    BlocProvider.of<RouteCubit>(context).navigateRouteNamed(
                        AutoRouteModel(path: AppRoutes.previewPagePath, data: {
                      'isBroadcaster': false,
                      'itemSessionsLiveDetails': eShow.toJson(),
                      'user': state.userEntity
                    }));
                  },
                ),
              )
            ],
          );
   */
  }

  childrenTabBarProfile(BuildContext context) {
    return <Widget>[
      tapOne(context),
      tapTwo(context),
    ];
  }

  /* static void showBottomSheetBuyNowStep1(
    BuildContext context,
    ItemAddresse? addresse,
    User user,
    ItemProduct productElement,
    List<ItemAddresse> listAddress,
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
          int type = productElement.shipping! ? 1 : 0;
          return StatefulBuilder(
            builder: (BuildContext _, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 35,
                    margin: EdgeInsets.only(top: 8, bottom: 28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 36,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                randomImage /* GetIt.I<GlobalConfiguration>().getValue(
                                    ConstGlobalConfiguration.baseUrlMedia) +
                                productElement.img! */
                            ,
                            cacheManager: AppCacheManager(),
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
                        SizedBox(
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
                              SizedBox(
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
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    priceProd(productElement.price!,
                                        user.currency ?? ""),
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
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
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
                                      SizedBox(
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
                                      SizedBox(
                                        width: 14,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (productElement.qte! > qte) {
                                            setState(() => qte++);
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
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
                                      SizedBox(
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
                      margin: EdgeInsets.symmetric(horizontal: 36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
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
                              S.current.delivery,
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
                                Divider(
                                  height: 1,
                                  color: StaticColors.borderGray,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ListTile(
                                  onTap: () {
                                    showBottomSheetAddress(
                                      context,
                                      () {},
                                      (item) {
                                        context
                                            .read<UserFollowerCubit>()
                                            .selectAddressOrder(item.id ?? "");
                                        context
                                            .read<UserFollowerCubit>()
                                            .getAddress();
                                        context.router.popForced();
                                        setState(() {
                                          addresse = item;
                                        });
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
                                    (addresse != null) ? addresse!.name! : "",
                                    maxLines: 2,
                                    style: ThemeData()
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: StaticColors.subGray),
                                  ),
                                  subtitle: Text(
                                    (addresse != null)
                                        ? addresse!.description!
                                        : "",
                                    maxLines: 2,
                                    style: ThemeData()
                                        .textTheme
                                        .headline1
                                        ?.copyWith(
                                            color: StaticColors.appColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  trailing: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6)),
                                      color: StaticColors.nextBg,
                                    ),
                                    child: SvgPicture.asset(
                                      AssetsPath.iconNext,
                                      color: StaticColors.blue4,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Visibility(
                    visible: productElement.collect!,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
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
                              context
                                  .read<UserFollowerCubit>()
                                  .selectAddressOrder(
                                      productElement.addressId!);
                              setState(() => type = 1);
                            },
                            title: Text(
                              S.current.pickup_address,
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
                                Divider(
                                  height: 1,
                                  color: StaticColors.borderGray,
                                ),
                                SizedBox(
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
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.products_price,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              (doubleToStringCurrency(newPriceProd(
                                          productElement.price!,
                                          productElement.currency!) *
                                      qte)) +
                                  " " +
                                  productElement.currency!,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.delivery_fees,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              ((type == 0)
                                      ? "${doubleToStringCurrency(deliveryFees())} "
                                      : "0 ") +
                                  (ConnectedRate().rateItem.base!),
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.total,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              priceProd(
                                  ((productElement.price! * qte) +
                                      ((type == 0) ? deliveryFees() : 0)),
                                  user.currency ?? ""),
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
                  SizedBox(
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
                        return EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.payment,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
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
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showBottomSheetBuy(
      BuildContext context,
      User user,
      ItemProduct productElement,
      VoidCallback addToCartAction,
      VoidCallback buyAction) {
    showModalBottomSheet<void>(
        context: context,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        builder: (BuildContext _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 2,
                width: 35,
                margin: EdgeInsets.only(top: 8, bottom: 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.5)),
                  color: StaticColors.colorBg,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          randomImage /*  GetIt.I<GlobalConfiguration>()
                              .getValue(ConstGlobalConfiguration.baseUrlMedia) +
                          productElement.img! */
                      ,
                      cacheManager: AppCacheManager(),
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
                  SizedBox(
                    width: 23,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productElement.brand ?? "",
                          style: ThemeData().textTheme.headline1!.copyWith(
                              color: StaticColors.subGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          productElement.label ?? "",
                          style: ThemeData().textTheme.headline1!.copyWith(
                              color: StaticColors.appColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          priceProd(productElement.price!, user.currency ?? ""),
                          style: ThemeData().textTheme.headline1!.copyWith(
                              color: StaticColors.appColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              SizeLivelListView(
                list: productElement.stocks ?? [],
                onItemTapped: (StockItem eShow) {
                  context.read<UserFollowerCubit>().selectStock(eShow);
                  selectSize(eShow, productElement);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  productElement.description ?? "",
                  textAlign: TextAlign.start,
                  style: ThemeData().textTheme.subtitle1?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: StaticColors.subGray),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return StaticColors.appColor;
                        }),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry>((Set<MaterialState> states) {
                          return EdgeInsets.symmetric(
                            vertical: 16,
                          );
                        }),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          S.current.add_to_card,
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      onPressed: addToCartAction),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          return StaticColors.activeIcon;
                        }),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry>((Set<MaterialState> states) {
                          return EdgeInsets.symmetric(
                              vertical: 16, horizontal: 30);
                        }),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            S.current.buy,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          SvgPicture.asset(
                            AssetsPath.seeMoreIcon,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: buyAction),
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          );
        });
  } */
/* 
  static void showBottomSheetAddress(
      BuildContext context,
      VoidCallback addAddresseAction,
      Function(ItemAddresse itemAddresse) selectAddressAction) {
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
                    margin: EdgeInsets.only(top: 8, bottom: 28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      S.current.delivery + " " + S.current.addresses,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  AddresseListView(
                    onItemTapped: (ItemAddresse eShow) {
                      selectAddressAction.call(eShow);
                    },
                    status: StateStatus.loaded,
                    listItemAddresse:
                        context.read<UserFollowerCubit>().state.listAddresse!,
                    onTapEdit: (ItemAddresse eShow) {
                      BlocProvider.of<RouteCubit>(context)
                          .navigateRouteNamedWithCallback(
                        AutoRouteModel(
                            path: AppRoutes.addAddressLivePagePath,
                            data: {
                              'pickUp': false,
                              'itemAddresses': eShow.toJson(),
                            }),
                        (call) {
                          context
                              .read<UserFollowerCubit>()
                              .selectAddressOrder(eShow.id!);
                          selectAddressAction.call(call as ItemAddresse);
                        },
                      );
                    },
                  ),
                  SizedBox(
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
                        return EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.add_address,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
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
                      BlocProvider.of<RouteCubit>(context)
                          .navigateRouteNamedWithCallback(
                        const AutoRouteModel(
                            path: AppRoutes.addAddressLivePagePath,
                            data: {
                              'pickUp': false,
                              'itemAddresses': ItemAddresse(),
                            }),
                        (call) {
                          selectAddressAction.call(call as ItemAddresse);
                          context
                              .read<UserFollowerCubit>()
                              .selectAddressOrder(call.id!);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showBottomSheetBuyNowStep2(
      User user,
      UserEntity userEntity,
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
                    margin: EdgeInsets.only(top: 8, bottom: 28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.5)),
                      color: StaticColors.colorBg,
                    ),
                  ),
                  Center(
                    child: Text(
                      S.current.payment,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        context.read<UserFollowerCubit>().selectPaymentOrder(1);
                        setState(() => index = 0);
                      },
                      title: Text(
                        S.current.credit_card,
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
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        context.read<UserFollowerCubit>().selectPaymentOrder(1);
                        setState(() => index = 1);
                      },
                      title: Row(
                        children: [
                          Text(
                            S.current.my_wallet,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: StaticColors.appColor),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: StaticColors.nextBg,
                            ),
                            child: Text(
                              doubleToStringCurrency(userEntity.wallet!) +
                                  " " +
                                  userEntity.symbole!,
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
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 37, right: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        width: 1,
                        color: StaticColors.borderGray,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        context.read<UserFollowerCubit>().selectPaymentOrder(0);
                        setState(() => index = 2);
                      },
                      title: Text(
                        S.current.cash_on_delivery,
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
                  SizedBox(
                    height: 21,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.products_price,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              (doubleToStringCurrency(newPriceProd(
                                          productElement.price!,
                                          productElement.currency!) *
                                      qte)) +
                                  " " +
                                  productElement.currency!,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.delivery_fees,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              ((type == 0)
                                      ? "${doubleToStringCurrency(deliveryFees())} "
                                      : "0 ") +
                                  (ConnectedRate().rateItem.base!),
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.appColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.total,
                              style: ThemeData().textTheme.subtitle1?.copyWith(
                                  color: StaticColors.subGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              priceProd(
                                  ((productElement.price! * qte) +
                                      ((type == 0) ? deliveryFees() : 0)),
                                  user.currency ?? ""),
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
                  SizedBox(
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
                        return EdgeInsets.symmetric(
                            vertical: 16, horizontal: 50);
                      }),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.payment,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
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
                  SizedBox(
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
                SizedBox(
                  height: 31,
                ),
                Center(
                  child: SvgPicture.asset(
                    AssetsPath.iconSuccessfullyResetPassword,
                    height: 115,
                    width: 115,
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      S.current.your_order_placed_successfully,
                      textAlign: TextAlign.center,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
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
                      return EdgeInsets.symmetric(
                          vertical: 16, horizontal: 50);
                    }),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.go_back,
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
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          );
        });
  }

  bool checkCart(
      List<CartDetailsItem> cartDetailsList, ItemProduct productElement) {
    if (cartDetailsList.isEmpty) {
      return true;
    }
    if (cartDetailsList[0].product!.ownerId == productElement.ownerId!) {
      return true;
    }
    return false;
  } */
}
