import 'package:auto_route/auto_route.dart';
import 'package:personal_guide/features/authentication/screens/sign_up/signup_screen.dart';

part "app_router.gr.dart";

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignUpRoute.page, initial: true),
  ];
}