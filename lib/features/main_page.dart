import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/navigation/router.gr.dart';

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
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
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
        );
      },
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: tabsRouter.activeIndex == 0
              ? const Text('Home')
              : const Text('Explore'),
          actions: [
            tabsRouter.activeIndex == 0
                ? IconButton(
                    onPressed: () async {
                      context.router.replace(const LoginRoute());
                      // SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.clear();
                    },
                    icon: const Icon(Icons.output_outlined))
                : Container(),
          ],
        );
      },
    );
  }
}
