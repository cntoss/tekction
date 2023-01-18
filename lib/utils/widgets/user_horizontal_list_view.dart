import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import '../../navigation/router.gr.dart';
import 'user_card.dart';

class UserHorizontalLiveListView extends StatefulWidget {
  const UserHorizontalLiveListView({
    Key? key,
    required this.status,
    required this.listItemSub,
    required this.onItemTapped,
    required this.onFollowTapped,
    required this.userId,
    this.itemExtent = 138.57,
  }) : super(key: key);
  final String status;
  final List<MainUser> listItemSub;
  final UserCardCallback onItemTapped;
  final FollowCallback onFollowTapped;
  final double itemExtent;
  final String userId;

  @override
  State<UserHorizontalLiveListView> createState() =>
      _UserHorizontalLiveListViewState();
}

class _UserHorizontalLiveListViewState
    extends State<UserHorizontalLiveListView> {
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
      padding: const EdgeInsets.only(left: 8, right: 8),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return UsersCard(
          itemSubMenuHome: widget.listItemSub[index],
          onTap: widget.onItemTapped,
          userId: widget.userId,
          onTapFollow: widget.onFollowTapped,
          index: index,
        );
      },
      itemExtent: widget.itemExtent,
      itemCount: widget.listItemSub.length,
    );

    return Column(
      children: [
        const SizedBox(height: 14),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 30),
            Text(
              "Recommended Shops",
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
                      text: "See more  ",
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
                context.router
                    .push(RecommendedScreenRoute(users: widget.listItemSub));
              },
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 150,
          child: eShowList,
        )
      ],
    );
  }
}
