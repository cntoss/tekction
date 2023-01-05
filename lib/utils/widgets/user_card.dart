import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';

typedef UserCardCallback = void Function(MainUser eShow);
typedef FollowCallback = void Function(MainUser eShow, int index);
Widget? _errorWidget;

class UsersCard extends StatelessWidget {
  const UsersCard({
    Key? key,
    required this.itemSubMenuHome,
    required this.onTap,
    required this.userId,
    required this.onTapFollow,
    required this.index,
    this.padding,
  }) : super(key: key);

  final MainUser itemSubMenuHome;
  final bool? padding;
  final UserCardCallback? onTap;
  final FollowCallback? onTapFollow;
  final int index;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final Widget coverImage;
    if (itemSubMenuHome.img != null) {
      coverImage = CachedNetworkImage(
        imageUrl: itemSubMenuHome.img ?? '',
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 250),
        fadeOutDuration: const Duration(milliseconds: 250),
        width: 138.57,
        height: 138.57,
        errorWidget: (_, __, ___) {
          return _errorWidget ??= Center(
            child: SvgPicture.asset(AssetsPath.placeholderProfile),
          );
        },
      );
    } else {
      coverImage = _errorWidget ??= Center(
        child: SvgPicture.asset(AssetsPath.placeholderProfile),
      );
    }

    return GestureDetector(
      onTap: onTap != null ? () => onTap!(itemSubMenuHome) : null,
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        decoration: const BoxDecoration(
          color: StaticColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 128.57,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: coverImage,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 138.57,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              StaticColors.gradientBlack1,
                              StaticColors.gradientBlack2
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            !itemSubMenuHome.follow!
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          itemSubMenuHome.username!,
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: StaticColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom().copyWith(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                const Set<MaterialState> interactiveStates =
                                    <MaterialState>{
                                  MaterialState.disabled,
                                };
                                return StaticColors.activeIcon;

                                //return  StaticColors.activeIcon;
                              }),
                              padding: MaterialStateProperty.resolveWith<
                                      EdgeInsetsGeometry>(
                                  (Set<MaterialState> states) {
                                return const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 18,
                                );
                              }),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Follow",
                                style: ThemeData()
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        color: StaticColors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                              ),
                            ),
                            onPressed: () =>
                                onTapFollow!(itemSubMenuHome, index)),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            itemSubMenuHome.username!,
                            style: ThemeData().textTheme.headline1?.copyWith(
                                color: StaticColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
