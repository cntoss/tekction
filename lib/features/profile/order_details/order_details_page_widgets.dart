part of 'order_details_page.dart';

mixin _OrderDetailsPageWidgets on _OrderDetailsPageProps {
  Widget body(BuildContext _context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.zero,
              child: Text(
                "Order ${widget.orderHistory.ref}",
                style: ThemeData().textTheme.headline1?.copyWith(
                      color: ColorManager.appColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.orderHistory.creator != null
                    ? "${widget.orderHistory.creator!.firstName} ${widget.orderHistory.creator!.lastName}\n${widget.orderHistory.creator!.username}"
                    : "",
                textAlign: TextAlign.center,
                style: ThemeData().textTheme.headline1?.copyWith(
                      color: ColorManager.grayPrice,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, bottom: 12),
            child: Text(
              DateFormat("d MMM yyyy\nHH:mm").format(
                  DateTime.parse(widget.orderHistory.createdAt!).toLocal()),
              style: ThemeData().textTheme.subtitle1?.copyWith(
                  color: ColorManager.appColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
          widget.orderHistory.status! == 5
              ? cancelledOrder()
              : (widget.orderHistory.collect == 0
                  ? stepsOrder()
                  : stepsOrderPickUo()),
          const SizedBox(
            height: 10,
          ),
          stateOrder(),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 10, left: 24, right: 37),
            child: Text(
              'Pickup location',
              style: ThemeData().textTheme.headline1?.copyWith(
                    color: ColorManager.appColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          ListTile(
            leading: Container(
              height: 44,
              width: 44,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ColorManager.bgColor),
              child: SvgPicture.asset(AssetsPath.pin),
            ),
            title: Text(
              widget.orderHistory.address!.name ?? "",
              maxLines: 2,
              style: ThemeData().textTheme.headline1?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: ColorManager.subGray),
            ),
            subtitle: Text(
              widget.orderHistory.address!.description ?? "",
              maxLines: 2,
              style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.appColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: ColorManager.nextBg,
              ),
              child: SvgPicture.asset(
                AssetsPath.iconNext,
                color: ColorManager.blue4,
              ),
            ),
            onTap: () {
              openMap(widget.orderHistory.address!.lat,
                  widget.orderHistory.address!.lng);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, bottom: 20),
            child: Text(
              "Products :",
              style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.appColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          OrderProductListView(
            listProduct: widget.orderHistory.products!,
          ),
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              (widget.orderHistory.collect == 0)
                  ? 'Paid with cash'
                  : 'Paid with credit card',
              style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.appColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Text(
                'Products price',
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.subGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const Spacer(),
              Text(
                'Rs ${widget.orderHistory.priceProd}',
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Text(
                'Delivery fees',
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.subGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const Spacer(),
              Text(
                (widget.orderHistory.collect == 0 ? deliveryFee : "Rs 0"),
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Text(
                'Total',
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.subGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const Spacer(),
              Text(
                'Rs ${widget.orderHistory.total!}',
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    color: ColorManager.appColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
          Visibility(
            visible: (widget.orderHistory.collect == 1),
            child: qrCodeView(),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    const Set<MaterialState> interactiveStates =
                        <MaterialState>{
                      MaterialState.disabled,
                    };
                    return ColorManager.activeIcon;
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Issue Complaint',
                        style: ThemeData().textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  context.router.push(
                      IssueComplaintRoute(orderHistory: widget.orderHistory));
                }),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 35, top: 17, right: 35),
              child: Text(
                'If there is any problem or delay with your order you can issue a complaint.',
                textAlign: TextAlign.center,
                style: ThemeData().textTheme.headline1?.copyWith(
                      color: ColorManager.grayPrice,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget qrCodeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 8, left: 24, right: 37),
          child: Text(
            "Qr code: ",
            style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.appColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 30, right: 37),
          child: Text(
            'The seller will need to scan the code to confirm receipt of your products',
            style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.grayPrice,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        Center(
          child: QrImage(
            data: widget.orderHistory.id!,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ],
    );
  }

  Widget stepsOrderPickUo() {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        (widget.orderHistory.status! == 1)
            ? circleStep(1)
            : SvgPicture.asset(AssetsPath.checkedIcon),
        Expanded(
          child: Divider(
            height: 1,
            color: (widget.orderHistory.status! > 1)
                ? ColorManager.purple
                : ColorManager.cancelGray,
          ),
        ),
        (widget.orderHistory.status! == 2)
            ? circleStep(2)
            : (widget.orderHistory.status! < 2)
                ? inactiveCircleStep(2)
                : SvgPicture.asset(
                    AssetsPath.checkedIcon,
                    color: ColorManager.purple,
                  ),
        Expanded(
          child: Divider(
            height: 1,
            color: (widget.orderHistory.status! > 3)
                ? ColorManager.green
                : ColorManager.cancelGray,
          ),
        ),
        (widget.orderHistory.status! == 4)
            ? circleStep(4)
            : (widget.orderHistory.status! < 4)
                ? inactiveCircleStep(4)
                : SvgPicture.asset(
                    AssetsPath.checkedIcon,
                    color: ColorManager.green,
                  ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }

  Widget stepsOrder() {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        (widget.orderHistory.status! == 1)
            ? circleStep(1)
            : SvgPicture.asset(AssetsPath.checkedIcon),
        Expanded(
          child: Divider(
            height: 1,
            color: (widget.orderHistory.status! > 1)
                ? ColorManager.purple
                : ColorManager.cancelGray,
          ),
        ),
        (widget.orderHistory.status! == 2)
            ? circleStep(2)
            : (widget.orderHistory.status! < 2)
                ? inactiveCircleStep(2)
                : SvgPicture.asset(
                    AssetsPath.checkedIcon,
                    color: ColorManager.purple,
                  ),
        Expanded(
          child: Divider(
            height: 1,
            color: (widget.orderHistory.status! > 2)
                ? ColorManager.orange
                : ColorManager.cancelGray,
          ),
        ),
        (widget.orderHistory.status! == 3)
            ? circleStep(3)
            : (widget.orderHistory.status! < 3)
                ? inactiveCircleStep(3)
                : SvgPicture.asset(
                    AssetsPath.checkedIcon,
                    color: ColorManager.orange,
                  ),
        Expanded(
          child: Divider(
            height: 1,
            color: (widget.orderHistory.status! > 3)
                ? ColorManager.green
                : ColorManager.cancelGray,
          ),
        ),
        (widget.orderHistory.status! == 4)
            ? circleStep(4)
            : (widget.orderHistory.status! < 4)
                ? inactiveCircleStep(4)
                : SvgPicture.asset(
                    AssetsPath.checkedIcon,
                    color: ColorManager.green,
                  ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }

  Widget cancelledOrder() {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        SvgPicture.asset(AssetsPath.checkedIcon),
        const Expanded(
          child: Divider(
            height: 1,
            color: ColorManager.cancelGray,
          ),
        ),
        SvgPicture.asset(AssetsPath.cancelledIcon),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }

  Widget circleStep(int index) {
    return Column(
      children: [
        Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            color: widget.orderHistory.status == 1
                ? ColorManager.appColor
                : widget.orderHistory.status == 2
                    ? ColorManager.purple
                    : widget.orderHistory.status == 3
                        ? ColorManager.orange
                        : ColorManager.green,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.orderHistory.status.toString(),
            style: ThemeData().textTheme.headline1?.copyWith(
                color: ColorManager.white,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget inactiveCircleStep(int index) {
    return Container(
      height: 26,
      width: 26,
      decoration: const BoxDecoration(
        color: ColorManager.colorSup,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        index.toString(),
        style: ThemeData().textTheme.headline1?.copyWith(
            color: ColorManager.white,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget stateOrder() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 25,
        ),
        Visibility(
          visible: (widget.orderHistory.status! == 1),
          child: textStep('Processing', ColorManager.appColor),
        ),
        const Spacer(),
        Visibility(
          visible: (widget.orderHistory.status! == 2),
          child: textStep('Confirmed', ColorManager.purple),
        ),
        const Spacer(),
        Visibility(
          visible: (widget.orderHistory.status! == 3),
          child: textStep('Shipped', ColorManager.orange),
        ),
        const Spacer(),
        Visibility(
          visible: (widget.orderHistory.status! == 4),
          child: textStep('Delivered', ColorManager.green),
        ),
        const Spacer(),
      ],
    );
  }

  Widget textStep(String step, Color color) {
    return Text(
      step,
      style: ThemeData()
          .textTheme
          .headline1
          ?.copyWith(color: color, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
