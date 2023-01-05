import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';

import '../../../utils/widgets/empty_view.dart';
import '../../../utils/widgets/icon_button_circle.dart';
import '../../../utils/widgets/molecules/custom_auto_back.dart';
import '../../../utils/widgets/tapbar/tapbar_custom.dart';

part 'user_follower_page_props.dart';
part 'user_follower_page_widget.dart';

class UserFollowerPage extends StatefulWidget {
  const UserFollowerPage({Key? key, required this.user}) : super(key: key);
  final MainUser user;

  @override
  _UserFollowerPageState createState() => _UserFollowerPageState();
}

class _UserFollowerPageState extends _UserFollowerPageProps
    with _UserFollowerPageWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: StaticColors.appColor,
                ),
                padding: const EdgeInsets.only(
                    top: 14, left: 20, right: 20, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AutoBackCustom(),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 72,
                            width: 72,
                            clipBehavior: Clip.antiAlias,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: CachedNetworkImage(
                              imageUrl: /* GetIt.I<GlobalConfiguration>().getValue(
                                      ConstGlobalConfiguration.baseUrlMedia) + */
                                  widget.user.img!,
                              fit: BoxFit.cover,
                              fadeInDuration: const Duration(milliseconds: 250),
                              fadeOutDuration:
                                  const Duration(milliseconds: 250),
                              width: 99,
                              height: 99,
                              errorWidget: (_, __, ___) {
                                return CircleAvatar(
                                  radius: 45,
                                  backgroundColor: StaticColors.bgGray2,
                                  child: SvgPicture.asset(
                                    AssetsPath.placeholderProfile,
                                    width: 99,
                                    height: 99,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButtonCircle(
                              onPressed: () {
                                /* context
                                    .read<UserFollowerCubit>()
                                    .createDynamicLink(
                                        dynamicLinks, "", widget.user.id!); */
                              },
                              icon: AssetsPath.shearIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${widget.user.firstName ?? ""} ${widget.user.lastName ?? ""}",
                      textAlign: TextAlign.center,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.user.username ?? "",
                      textAlign: TextAlign.center,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: StaticColors.gradientName),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.user.bio ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: StaticColors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListTile(
                            onTap: () {
                              /*  BlocProvider.of<RouteCubit>(context)
                                  .navigateRouteNamed(AutoRouteModel(
                                      path: AppRoutes.followPagePath,
                                      data: FollowBody(
                                          followType: FollowType.following,
                                          userId: widget.user.id!))); */
                            },
                            title: Text(
                              '22', //state.following.toString(),
                              textAlign: TextAlign.center,
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            subtitle: Text("Following",
                                textAlign: TextAlign.center,
                                style: ThemeData()
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: StaticColors.gradientName)),
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: ListTile(
                            onTap: () {
                              /* BlocProvider.of<RouteCubit>(context)
                                  .navigateRouteNamed(AutoRouteModel(
                                      path: AppRoutes.followPagePath,
                                      data: FollowBody(
                                          followType: FollowType.followers,
                                          userId: widget.user.id!))); */
                            },
                            title: Text(
                              '22.3k', //state.followers.toString(),
                              textAlign: TextAlign.center,
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            subtitle: Text("Followers",
                                textAlign: TextAlign.center,
                                style: ThemeData()
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: StaticColors.gradientName)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
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
                            return /* state.followItem != null
                                ? StaticColors.disableBtn
                                : */
                                StaticColors.activeIcon;
                          }),
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>((Set<MaterialState> states) {
                            return const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 40,
                            );
                          }),
                        ),
                        child: Text(
                          /*  state.followItem != null
                              ? S.current.unfollow
                              :  */
                          "  Follow  ",
                          style: ThemeData().textTheme.headline1?.copyWith(
                              color: StaticColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          /*  if (state.followItem != null) {
                            context.read<UserFollowerCubit>().unFollow(context);
                          } else {
                            context
                                .read<UserFollowerCubit>()
                                .sendFollow(widget.user.id!, context);
                          } */
                        }),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 65),
                child: TabBarCustom(
                  tabController: _tabController,
                  listTabs: tabsProfile(),
                )),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: childrenTabBarProfile(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
