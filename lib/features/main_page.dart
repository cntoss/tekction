import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/navigation/arguments_route.dart';
import 'package:tekction/navigation/router.gr.dart';

import '../utils/logout_helper.dart';
import '../utils/profile_router_helper.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: const [
        HomeRoute(),
        ExploreRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        bool hideToolbar =
            tabsRouter.topMatch.meta[ArgumentsRoute.hideToolbar] == true;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 55),
            child: Visibility(
              visible: !hideToolbar,
              child: AppBar(
                title: tabsRouter.activeIndex == 0
                    ? const Text('Home')
                    : const Text('Explore'),
                actions: [
                  tabsRouter.activeIndex == 0
                      ? IconButton(
                          onPressed: () async {
                            checkToProfile(context);
                            // LogoutHelper().loggedOutAlert(context);
                          },
                          icon: const Icon(Icons.person))
                      : Container(),
                ],
              ),
            ),
          ),
          body: child,
          bottomNavigationBar: Visibility(
            visible: !hideToolbar,
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
