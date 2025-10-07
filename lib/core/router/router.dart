
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/game/view/game_screen.dart';
import '../../features/info/view/how_to_play_screen.dart';
import '../../features/leader/view/leader_screen.dart';
import '../../features/level/view/level_screen.dart';
import '../../features/loading/view/loading_screen.dart';
import '../../features/menu/view/menu_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/settings/view/settings_screen.dart';
import '../../features/shop/view/shop_screen.dart';

part 'router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, path: '/', initial: true),

    AutoRoute(
      page: MenuRoute.page,
      path: '/menu',
      children: [
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
        AutoRoute(page: LevelRoute.page, path: 'level'),
        AutoRoute(page: LeaderRoute.page, path: 'leader'),
        AutoRoute(page: ShopRoute.page, path: 'shop'),
        AutoRoute(page: HowToPlayRoute.page, path: 'how_to_play'),
        AutoRoute(page: GameRoute.page, path: 'game'),
      ],
    ),
  ];
}