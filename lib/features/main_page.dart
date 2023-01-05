import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/navigation/arguments_route.dart';
import 'package:tekction/navigation/router.gr.dart';

import '../utils/profile_router_helper.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool? isBroadCaster;

  @override
  void initState() {
    checkBroadcaster();
    super.initState();
  }

  checkBroadcaster() async {
    await [Permission.microphone, Permission.camera].request();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    setState(() {
      isBroadCaster = sharedPref.getBool(broadcasterKey) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      extendBody: true,
      routes: const [HomeRoute(), ExploreRoute(), CartRoute()],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        bool hideToolbar =
            tabsRouter.topMatch.meta[ArgumentsRoute.hideToolbar] == true;
        return Scaffold(
          appBar: ((tabsRouter.activeIndex != 0 &&
                      tabsRouter.activeIndex != 2) ||
                  hideToolbar)
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(0), child: SizedBox.shrink())
              : PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 80),
                  child: Visibility(
                    visible: !hideToolbar,
                    child: AppBar(
                      centerTitle: false,
                      title: tabsRouter.activeIndex == 0
                          ? Text(
                              'Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            )
                          : Text(
                              'My Cart',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            ),
                      actions: [
                        tabsRouter.activeIndex == 0
                            ? IconButton(
                                onPressed: () async {
                                  checkToProfile(context);
                                  // LogoutHelper().loggedOutAlert(context);
                                },
                                icon: const Icon(Icons.person))
                            : Container(),
                        if (tabsRouter.activeIndex == 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                decoration: const BoxDecoration(
                                  color: StaticColors.bgSetting,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Rs. 145.44',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
