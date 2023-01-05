import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({
    Key? key,
    required this.tabController,
    required this.listTabs,
  }) : super(key: key);

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController tabController;

  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> listTabs;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 48,
      decoration: BoxDecoration(
        color: StaticColors.dividerColor,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: TabBar(
          controller: tabController,
          // give the indicator a decoration (color and border radius)
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: Colors.white,
          ),
          labelColor: StaticColors.appColor,
          unselectedLabelColor: StaticColors.getSubTitleDisabledColor(context),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w500, color: StaticColors.gray8),
          labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.w700, color: StaticColors.appColor),
          tabs: listTabs),
    );
  }
}
