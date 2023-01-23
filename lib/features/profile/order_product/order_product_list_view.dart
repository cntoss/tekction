import 'package:flutter/material.dart';
import 'package:tekction/data/model/mode.dart';
import 'order_product_card.dart';

class OrderProductListView extends StatefulWidget {
  const OrderProductListView({
    Key? key,
    required this.listProduct,
  }) : super(key: key);
  final List<ProductElement> listProduct;

  @override
  State<OrderProductListView> createState() => _OrderProductListViewState();
}

class _OrderProductListViewState extends State<OrderProductListView> {
  final ScrollController _eShowListController = ScrollController();

  @override
  void dispose() {
    _eShowListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget eShowList;

    eShowList = ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.listProduct.length,
      itemBuilder: (context, index) {
        return OrderProductCard(
          itemProduct: widget.listProduct[index],
        );
      },
    );

    return eShowList;
  }
}
