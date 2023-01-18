import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart' hide ProfileScreen;
import 'package:tekction/features/profile/profile.dart';

import 'arguments_route.dart';

const profileTab = AutoRoute(
  path: AppRoutes.profilePath,
  page: EmptyRouterPage,
  name: AppRoutes.profileRouteName,
  children: [
    AutoRoute(path: '', page: ProfileScreen),
    AutoRoute(
      path: AppRoutes.settingsPath,
      page: SettingsScreen,
      name: AppRoutes.settingsRouteName,
      meta: {ArgumentsRoute.hideToolbar: true},
    ),
    AutoRoute(
      path: AppRoutes.productPath,
      page: ProductPage,
      meta: {ArgumentsRoute.hideToolbar: true},
    ),
    AutoRoute(
      path: AppRoutes.profileEditPath,
      page: EditProfileScreen,
      meta: {ArgumentsRoute.hideToolbar: true},
    ),
    AutoRoute(
        path: AppRoutes.changePasswordPath,
        page: ChangePasswordScreen,
        meta: {ArgumentsRoute.hideToolbar: true}),
  ],
);
