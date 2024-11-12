import 'package:auto_route/auto_route.dart';
import 'package:chatify_app/features/auth/login/state/login_inherited_state.dart';
import 'package:chatify_app/features/auth/register/state/register_inherited_state.dart';
import 'package:chatify_app/features/common/splash/splash_view.dart';
import 'package:chatify_app/features/home/navbar/navbar_view.dart';
import 'package:chatify_app/features/home/profile/profile_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// AppRouter is the main router management class for the app.
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: NavbarRoute.page),
        AutoRoute(page: LoginInheritedProviderRoute.page),
        AutoRoute(page: RegisterInheritedProviderRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
