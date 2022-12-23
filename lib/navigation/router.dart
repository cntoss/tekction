import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:tekction/features/home/screen/home_page.dart';
import 'package:tekction/features/login/login.dart';
import 'package:tekction/features/splash/splash_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route,Dialog',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          initial: true,
          name: AppRoutes.splashRouteName,
          path: AppRoutes.splashPath,
          page: SplashScreen,
        ),
        AutoRoute(
          name: AppRoutes.loginRouteName,
          path: AppRoutes.loginPath,
          page: LoginScreen,
        ),
        AutoRoute(
          name: AppRoutes.homeRouteName,
          path: AppRoutes.homePath,
          page: HomePage,
        ),
      ],
    )
  ],
)

/// extend the generated private router
class $AppRouter {}
