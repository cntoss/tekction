import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';
import 'package:tekction/utils/widgets/product_card.dart';

import '../../../core/enum/see_all_type.dart';
import '../../../navigation/router.gr.dart';

class ProductHorizontalLiveListView extends StatefulWidget {
  const ProductHorizontalLiveListView({
    Key? key,
    required this.status,
    required this.listItemSub,
    required this.onItemTapped,
    required this.userId,
    this.itemExtent = 173,
  }) : super(key: key);
  final String status;
  final List<ItemProduct> listItemSub;
  final ProductCardCallback onItemTapped;
  final double itemExtent;
  final String userId;

  @override
  State<ProductHorizontalLiveListView> createState() =>
      _ProductHorizontalLiveListViewState();
}

class _ProductHorizontalLiveListViewState
    extends State<ProductHorizontalLiveListView> {
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
      controller: _eShowListController,
      physics: const PageScrollPhysics(),
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          itemSubMenuHome: widget.listItemSub[index],
          onTap: widget.onItemTapped,
          userId: widget.userId,
        );
      },
      itemExtent: widget.itemExtent,
      itemCount: widget.listItemSub.length,
    );

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 30),
            Text(
              'Trending Products',
              style: ThemeData().textTheme.headline1?.copyWith(
                  color: ColorManager.appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom().copyWith(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return Colors.transparent;
                }),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'See More ',
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: ColorManager.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    WidgetSpan(
                      child: SvgPicture.asset(
                        AssetsPath.seeMoreIcon,
                        color: ColorManager.purple,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                context.router.push(SeeAllPageRoute(type: SeeAllType.product));
              },
            ),
          ],
        ),
        SizedBox(
          height: 270,
          child: eShowList,
        )
      ],
    );
  }
}
