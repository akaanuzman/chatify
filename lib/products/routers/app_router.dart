import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_state.dart';
import 'package:chatify_app/features/common/splash/splash_view.dart';
import 'package:chatify_app/features/home/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter is the main router management class for the app.
final class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginInheritedProviderRoute.page),
      ];
}
