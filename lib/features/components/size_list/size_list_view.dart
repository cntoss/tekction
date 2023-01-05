import 'package:flutter/material.dart';
import 'package:tekction/features/components/size_list/size_card.dart';

import '../../../data/model/mode.dart';

class SizeLivelListView extends StatefulWidget {
  const SizeLivelListView({
    Key? key,
    required this.list,
    required this.onItemTapped,
  }) : super(key: key);
  final List<StockItem> list;
  final SizeCardCallback onItemTapped;

  @override
  State<SizeLivelListView> createState() => _SizeLivelListViewState();
}

class _SizeLivelListViewState extends State<SizeLivelListView> {
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
      controller: _eShowListController,
      physics: const PageScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      itemBuilder: (BuildContext context, int index) {
        return SizeCard(
          onTap: widget.onItemTapped,
          sizeItem: widget.list[index],
        );
      },
      itemCount: widget.list.length,
    );

    return SizedBox(
      height: 40,
      child: eShowList,
    );
  }
}
