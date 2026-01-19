import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OtpLoginRoute.page),
    AutoRoute(page: TermsRoute.page),

    AutoRoute(
      page: MainLayoutRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MyEmergencyRoute.page),
        AutoRoute(page: TermsRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: AddEmergenceRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ComplaintRoute.page),
    AutoRoute(page: PdfViewRoute.page),
  ];
}
