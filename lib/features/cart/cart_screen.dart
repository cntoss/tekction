import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import '../../navigation/router.gr.dart';
import '../../utils/widgets/basic_scaffold_view.dart';
import '../../utils/widgets/product_list_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final itemProducts = [
    CartDetailsItem(
      id: 'id1',
      status: 1,
      createdAt: '${DateTime.now()}',
      price: 12.12,
      qte: 12,
      userId: 'userid1',
      productId: 'productId1',
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
      stock: StockItem(
        id: 'si1',
        qte: 2,
        sold: 2,
        sizeId: '2',
        productId: '2',
        name: '2',
        size: SizeItem(
          id: 'size2',
          name: 'size name',
          description: 'size desc',
          status: 1,
          createdAt: 'asd',
        ),
        select: true,
      ),
      size: SizeItem(
        id: 'size2',
        name: 'size name',
        description: 'size desc',
        status: 1,
        createdAt: 'asd',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BasicScaffoldView(
      bodyWidget: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            ProductListView(
              status: 'loaded',
              listItemProduct: itemProducts,
              onTapAdd: (int index) {},
              onTapDelete: (int index) {},
              onTapReduce: (int index) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    return ColorManager.activeIcon;
                  }),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                          (Set<MaterialState> states) {
                    return const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    );
                  }),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Proceed to checkout',
                      overflow: TextOverflow.ellipsis,
                      style: ThemeData().textTheme.headline1?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
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
                onPressed: () {
                  context.router.push(CheckoutRoute(list: itemProducts));
                },
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
