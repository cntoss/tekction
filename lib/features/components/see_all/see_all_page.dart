import 'package:dependencies/dependencies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';

import '../../../core/enum/see_all_type.dart';
import '../../../data/model/mode.dart';
import '../../../navigation/router.gr.dart';
import '../../../utils/widgets/molecules/custom_auto_back.dart';
import '../product_list/product_gridview.dart';
import '../product_list/products.dart';
part 'see_all_page_props.dart';

part 'see_all_page_widgets.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key? key, required this.type}) : super(key: key);
  final SeeAllType type;

  @override
  _SeeAllPageState createState() => _SeeAllPageState();

  /* @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SeeAllBloc>(
      create: (context) => SeeAllBloc(),
      child: this,
      lazy: true,
    );
  } */
}

class _SeeAllPageState extends _SeeAllPageProps with _SeeAllPageWidgets {
  @override
  void initState() {
    /* context.read<SeeAllBloc>().add(const GetUserEvent());
    context.read<SeeAllBloc>().add(SelectedSearchTypeChangedEvent(widget.type));
    context.read<SeeAllBloc>().add(const LoadMoreSearchEvent());
     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.appColor,
    ));
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            controller: _searchListScrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    const AutoBackCustom(
                      color: ColorManager.appColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      (widget.type == SeeAllType.event)
                          ? 'New and upcoming'
                          : (widget.type == SeeAllType.product)
                              ? 'Trending products'
                              : 'Recommended Shops',
                      style: ThemeData().textTheme.headline1?.copyWith(
                            color: ColorManager.appColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  ],
                ),
                ProductGridView(
                  userId: '',
                  onItemTapped: (ItemProduct eShow) {
                    context.router
                        .push(DetailsProductPageRoute(product: eShow));
                  },
                  listItemSub: products,
                )
                /* ((emptyList(state.userList) &&
                              emptyList(state.eventList) &&
                              emptyList(state.productList)))
                          ? SingleChildScrollView(
                              child: Center(
                                child: EmptyView(
                                  failure: state.failure,
                                  image: AssetsPath.emptyProduct,
                                  supText: S.current.no_results_were_found,
                                  width: 265.85,
                                  height: 216,
                                  textColor: StaticColors.appColor,
                                  onRefresh: () {
                                    context
                                        .read<SeeAllBloc>()
                                        .add(const GetUserEvent());
                                    context.read<SeeAllBloc>().add(
                                        SelectedSearchTypeChangedEvent(
                                            widget.type));
                                    context
                                        .read<SeeAllBloc>()
                                        .add(const LoadMoreSearchEvent());
                                  },
                                ),
                              ),
                            )
                          : !emptyList(state.productList)
                              ? ProductHorizontaLivelListView(
                                  userId: '',
                                  onItemTapped: (ItemProduct eShow) {
                                    BlocProvider.of<RouteCubit>(context)
                                        .navigateRouteNamed(AutoRouteModel(
                                      path: AppRoutes.detailsProductPagePath,
                                      data:
                                          ItemProduct.fromJson(eShow.toJson()),
                                    ));
                                  },
                                  listItemSub: state.productList,
                                  status: state.status,
                                )
                              : !emptyList(state.eventList)
                                  ? HomeHorizontalListView(
                                      status: state.status,
                                      listItemSub: state.eventList,
                                      onItemTapped: (item) {
                                        if (state.userEntity != null) {
                                          BlocProvider.of<RouteCubit>(context)
                                              .navigateRouteNamed(
                                                  AutoRouteModel(
                                                      path: AppRoutes
                                                          .previewPagePath,
                                                      data: {
                                                'isBroadcaster': false,
                                                'itemSessionsLiveDetails':
                                                    item.toJson(),
                                                'user': state.userEntity
                                              }));
                                        } else {
                                          showBottomSheetLogin(context, () {
                                            //TODO go to login
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .loginPath));
                                          }, () {
                                            //TODO go to signup
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .registerPath));
                                          });
                                        }
                                      },
                                      onTapShare: (item) {
                                        context
                                            .read<SeeAllBloc>()
                                            .createDynamicLink(dynamicLinks,
                                                item.id!, item.userId!);
                                      },
                                      userId: (state.userEntity != null)
                                          ? state.userEntity!.id!
                                          : "",
                                      onItemReservation: (item, index) {
                                        if (state.userEntity != null) {
                                          context
                                              .read<SeeAllBloc>()
                                              .sendReservation(
                                                  item.id!, index, context);
                                        } else {
                                          showBottomSheetLogin(context, () {
                                            //TODO go to login
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .loginPath));
                                          }, () {
                                            //TODO go to signup
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .registerPath));
                                          });
                                        }
                                      },
                                      onTapUser: (item) {
                                        if (state.userEntity != null) {
                                          BlocProvider.of<RouteCubit>(context)
                                              .navigateRouteNamed(
                                                  AutoRouteModel(
                                            path:
                                                AppRoutes.userFollowerPagePath,
                                            data: item.user,
                                          ));
                                        } else {
                                          showBottomSheetLogin(context, () {
                                            //TODO go to login
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .loginPath));
                                          }, () {
                                            //TODO go to signup
                                            context.router.pop();
                                            BlocProvider.of<RouteCubit>(context)
                                                .navigateRouteNamed(
                                                    const AutoRouteModel(
                                                        path: AppRoutes
                                                            .registerPath));
                                          });
                                        }
                                      },
                                    )
                                  : UserHorizontaLivelListView(
                                      userId: state.userEntity!.id!,
                                      onItemTapped: (User eShow) {
                                        BlocProvider.of<RouteCubit>(context)
                                            .navigateRouteNamed(AutoRouteModel(
                                          path: AppRoutes.userFollowerPagePath,
                                          data: eShow,
                                        ));
                                      },
                                      onFollowTapped: (User eShow, int index) {
                                        if (!eShow.follow!) {
                                          context.read<SeeAllBloc>().sendFollow(
                                              eShow.id!, index, context);
                                          //context.read<SeeAllBloc>().unFollow(index,context);
                                        }
                                      },
                                      status: state.status,
                                      listItemSub: state.userList,
                                    ),
                   */
              ],
            ),
          ),
        ));
  }
}
