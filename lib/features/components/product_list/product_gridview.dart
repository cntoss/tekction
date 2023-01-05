import 'package:flutter/material.dart';

import '../../../data/model/mode.dart';
import '../../../utils/widgets/product_card.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({
    Key? key,
    //required this.status,
    required this.listItemSub,
    required this.onItemTapped,
    required this.userId,
    this.itemExtent = 173,
  }) : super(key: key);
  //final StateStatus status;
  final List<ItemProduct> listItemSub;
  final ProductCardCallback onItemTapped;
  final double itemExtent;
  final String userId;

  @override
  State<ProductGridView> createState() => _ProductHorizontaLivelListViewState();
}

class _ProductHorizontaLivelListViewState extends State<ProductGridView> {
  final ScrollController _eShowListController = ScrollController();

  @override
  void dispose() {
    _eShowListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /* if (widget.status == StateStatus.loading) {
      return Container();
    } */
    Widget eShowList;

    eShowList = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        shrinkWrap: true,
        controller: _eShowListController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.listItemSub.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            itemSubMenuHome: widget.listItemSub[index],
            onTap: widget.onItemTapped,
            userId: widget.userId,
          );
        });
/*    eShowList = ListView.builder(
      controller: _eShowListController,
      physics: const PageScrollPhysics(),
      padding:
          EdgeInsets.only(top: 12.h, left: 8.w, right: 8.w, bottom: 20.h),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          itemSubMenuHome: widget.listItemSub[index],
          onTap: widget.onItemTapped,
          userId: widget.userId,
        );
      },
      itemExtent: widget.itemExtent.w,
      itemCount: widget.listItemSub.length,
    );*/

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: eShowList,
    );
  }
}
