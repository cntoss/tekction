import 'package:flutter/material.dart';

import '../../data/model/mode.dart';
import 'shop_card.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({
    Key? key,
    required this.status,
    required this.listItemProduct,
    required this.onTapDelete,
    required this.onTapAdd,
    required this.onTapReduce,
  }) : super(key: key);
  final String status;
  final List<CartDetailsItem> listItemProduct;
  final ProductDeleteCardCallback onTapDelete;
  final ProductAddCardCallback onTapAdd;
  final ProductReduceCardCallback onTapReduce;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ScrollController _eShowListController = ScrollController();

  @override
  void dispose() {
    _eShowListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.status == 'loading') {
      return Container();
    }
    Widget eShowList;

    eShowList = ListView.builder(
      shrinkWrap: true,
      controller: _eShowListController,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 18.0, left: 8, right: 8, bottom: 10),
      scrollDirection: Axis.vertical,
      itemCount: widget.listItemProduct.length,
      itemBuilder: (BuildContext context, int index) {
        return ShopCard(
          itemProduct: widget.listItemProduct[index],
          onTapReduce: widget.onTapReduce,
          onTapDelete: widget.onTapDelete,
          onTapAdd: widget.onTapAdd,
          index: index,
        );
      },
    );

    return eShowList;
  }
}
