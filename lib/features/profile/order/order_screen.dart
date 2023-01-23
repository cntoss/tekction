import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';
import 'package:tekction/navigation/router.gr.dart';
import 'package:tekction/utils/widgets/arrow_button.dart';

import '../../../locator.dart';
import '../../../utils/ui_helper.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderDetails orders = OrderDetails(
    id: '01',
    status: 4,
    payment: 123,
    collect: 1,
    priceProd: 1234,
    priceDel: 12,
    total: 12223,
    createdAt: DateTime.now().toString(),
    labelUrl: 'https://picsum.photos/1000/1000',
    shipmentId: '',
    pickupId: '',
    pickupDelId: '',
    address: Address(
      id: 'addid1',
      status: 1,
      name: 'addname1',
      lat: 12.12,
      lng: 12.12,
      description: 'adddesc1',
      city: 'addcity 1',
      zipCode: '123',
      createdAt: '${DateTime.now()}',
      userId: 'adduserid1',
    ),
    userId: '11',
    addressId: '11',
    ref: '123',
    user: MainUser(
      bio: 'bio1',
      code: 'code1',
      codePass: 'codePass1',
      id: '1',
      firstName: 'f',
      lastName: 'l',
      username: 'u1',
      email: 'aa1',
      gender: 'm1',
      phone: '11',
      status: 1,
      createdAt: '${DateTime.now()}',
      oneSignalId: 'asd',
      registrationId: 'zz',
      role: 'aw',
      verified: true,
      osType: 'aaa',
      pickup: 'pickup 1',
      followersNb: 2,
      followingNb: 2,
      follow: false,
      fId: 'fid1',
      currency: 'cr1',
      symbol: 'NPR',
      img: 'https://picsum.photos/1000/1000',
    ),
    creator: MainUser(
      bio: 'bio1',
      code: 'code1',
      codePass: 'codePass1',
      id: '1',
      firstName: 'f',
      lastName: 'l',
      username: 'u1',
      email: 'aa1',
      gender: 'm1',
      phone: '11',
      status: 1,
      createdAt: '${DateTime.now()}',
      oneSignalId: 'asd',
      registrationId: 'zz',
      role: 'aw',
      verified: true,
      osType: 'aaa',
      pickup: 'pickup 1',
      followersNb: 2,
      followingNb: 2,
      follow: false,
      fId: 'fid1',
      currency: 'cr1',
      symbol: 'NPR',
      img: 'https://picsum.photos/1000/1000',
    ),
    products: [
      ProductElement(
        id: '',
        createdAt: '',
        sessionId: '',
        productId: '',
        price: 1234,
        qte: 1,
        num: 2,
        product: ItemProduct(
          id: 'id11',
          label: 'product 1',
          description: 'prod 1',
          price: 12.12,
          img: 'https://picsum.photos/1000/1000',
          qte: 12,
          sold: 1,
          brand: 'brand1',
          ownerId: 'ownerId1',
          addressId: 'addressId1',
          tagId: 'tagId1',
          count: 1,
          tag: Tag(
            id: 'id111',
            name: 'name1',
            description: 'description1',
            img: 'img1',
            ref: 'ref1',
            status: 1,
            createdAt: '${DateTime.now()}',
          ),
          address: Address(
            id: 'addid1',
            status: 1,
            name: 'addname1',
            lat: 12.12,
            lng: 12.12,
            description: 'adddesc1',
            city: 'addcity 1',
            zipCode: '123',
            createdAt: '${DateTime.now()}',
            userId: 'adduserid1',
          ),
          currency: 'NPR',
          symbol: 'NPR',
          shipping: true,
          collect: true,
          stocks: [
            StockItem(
              id: 'stockitemid1',
              qte: 2,
              sold: 2,
              sizeId: 'StockItemsizeid1',
              productId: 'StockItemproductid1',
              name: 'StockItemname1',
              size: SizeItem(
                id: 'SizeItem1',
                name: 'SizeItemname1',
                description: 'SizeItemdesx',
                status: 1,
                createdAt: '${DateTime.now()}',
              ),
              select: true,
            ),
          ],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: locator<UiHelper>().appBar(
        context,
        title: "Order History",
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: ListView(
          children: List.generate(5, (index) {
            orders.status = index % 5 + 1;
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://picsum.photos/100${index + 1}/100${index + 1}',
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 250),
                      fadeOutDuration: const Duration(milliseconds: 250),
                      width: 125,
                      height: 125,
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
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${orders.products!.first.product!.label}$index XL name$index"
                            .toUpperCase(),
                        style: ThemeData().textTheme.headline1!.copyWith(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${orders.address!.city}$index",
                        style: ThemeData().textTheme.headline1!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "NPR ${orders.products!.first.product!.price}$index",
                        style: ThemeData().textTheme.headline1!.copyWith(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      orderType(orders.status)
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        context.router
                            .push(OrderDetailsRoute(orderHistory: orders));
                      },
                      child: const ArrowButton()),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget orderType(int? status) {
    Color? color;
    String? type;
    switch (status) {
      case 1:
        color = ColorManager.appColor;
        type = "• Processing";
        break;
      case 2:
        color = ColorManager.purple;
        type = "• Confirmed";
        break;
      case 3:
        color = ColorManager.orange;
        type = "• Shipped";
        break;
      case 4:
        color = ColorManager.green;
        type = "• Delivered";
        break;
      case 5:
        color = ColorManager.gray;
        type = "• Cancelled";
        break;
    }
    return Text(
      type ?? '',
      style: ThemeData()
          .textTheme
          .headline1!
          .copyWith(color: color, fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
