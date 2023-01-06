import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';
import '../../navigation/router.gr.dart';
import '../../utils/widgets/empty_view.dart';
import '../../utils/widgets/search_input.dart';
import '../../utils/widgets/user_horizontal_list_view.dart';
import '../components/product_list/product_horizontal_list_view.dart';
import '../components/product_list/products.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: StaticColors.appColor,
            ),
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'explore',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                SearchTextInput(
                  controller: _searchController,
                  hint: 'Search for anything',
                  onChanged: (String value) {},
                  readOnly: true,
                  onTap: () {
                    // context.router.pushNamed(AppRoutes.searchPagePath);
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: false
                ? EmptyView(
                    image: AssetsPath.emptyFollow,
                    textColor: StaticColors.appColor,
                    supText: 'empty_order',
                    titleText: 'start_shopping_favorite_products',
                    width: 270,
                    height: 270,
                    onRefresh: () {},
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        UserHorizontalLiveListView(
                          onItemTapped: (eShow) {
                            context.router
                                .push(UserFollowerPageRoute(user: eShow));

                            /*  context.router
                                .pushNamed(AppRoutes.userFollowerPagePath); */
                            /*  BlocProvider.of<RouteCubit>(context)
                                .navigateRouteNamed(AutoRouteModel(
                              path: AppRoutes.userFollowerPagePath,
                              data: eShow,
                            )); */
                          },
                          listItemSub: [
                            MainUser(
                              bio: 'This is my bio',
                              code: 'asd',
                              codePass: 'asd',
                              id: 'asd',
                              firstName: 'Asmit ',
                              lastName: 'Kirana',
                              username: 'tekkon_boy',
                              email: 'asd',
                              gender: 'asd',
                              phone: 'asd',
                              status: 1,
                              createdAt: 'asd',
                              oneSignalId: 'asd',
                              registrationId: 'asd',
                              role: 'asd',
                              verified: true,
                              osType: 'asd',
                              pickup: 'asd',
                              followersNb: 2,
                              followingNb: 2,
                              follow: false,
                              fId: 'asd',
                              currency: 'asd',
                              symbol: 'asd',
                              img: 'https://picsum.photos/200/300.jpg',
                            ),
                            MainUser(
                              bio: 'asd',
                              code: 'asd',
                              codePass: 'asd',
                              id: 'asd',
                              firstName: 'Santosh',
                              lastName: 'Kirana',
                              username: 'cntoss',
                              email: 'asd',
                              gender: 'asd',
                              phone: 'asd',
                              status: 1,
                              createdAt: 'asd',
                              oneSignalId: 'asd',
                              registrationId: 'asd',
                              role: 'asd',
                              verified: true,
                              osType: 'asd',
                              pickup: 'asd',
                              followersNb: 2,
                              followingNb: 2,
                              follow: true,
                              fId: 'asd',
                              currency: 'asd',
                              symbol: 'asd',
                              img: 'https://picsum.photos/200/300.jpg',
                            ),
                            MainUser(
                              bio: 'asd',
                              code: 'asd',
                              codePass: 'asd',
                              id: 'asd',
                              firstName: 'asd',
                              lastName: 'asd',
                              username: 'asd',
                              email: 'asd',
                              gender: 'asd',
                              phone: 'asd',
                              status: 1,
                              createdAt: 'asd',
                              oneSignalId: 'asd',
                              registrationId: 'asd',
                              role: 'asd',
                              verified: true,
                              osType: 'asd',
                              pickup: 'asd',
                              followersNb: 2,
                              followingNb: 2,
                              follow: true,
                              fId: 'asd',
                              currency: 'asd',
                              symbol: 'asd',
                              img: 'https://picsum.photos/200/300.jpg',
                            ),
                          ],
                          status: 'loaded',
                          userId: '',
                          onFollowTapped: (MainUser eShow, int index) {},
                        ),
                        const SizedBox(height: 10),
                        ProductHorizontalLiveListView(
                          listItemSub: products,
                          status: 'loaded',
                          onItemTapped: (eShow) {
                            context.router
                                .push(DetailsProductPageRoute(product: eShow));
                            /*   BlocProvider.of<RouteCubit>(context)
                                .navigateRouteNamed(AutoRouteModel(
                              path: AppRoutes.detailsProductPagePath,
                              data: ItemProduct.fromJson(eShow.toJson()),
                            )); */
                          },
                          userId: '',
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
