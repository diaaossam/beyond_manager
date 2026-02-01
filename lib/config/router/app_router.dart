import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../helper/context_helper.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  GlobalKey<NavigatorState> get navigatorKey => NavigationService.navigatorKey;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OtpLoginRoute.page),
    AutoRoute(page: TermsRoute.page),
    AutoRoute(page: PolicyAccessSelectionRoute.page),
    AutoRoute(page: PolicyPaymentRoute.page),
    AutoRoute(page: PolicyInfoRoute.page),
    AutoRoute(page: ActiveListRoute.page),
    AutoRoute(
      page: MainLayoutRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MyEmergencyRoute.page),
        AutoRoute(page: PoliciesRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: AddEmergenceRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ComplaintRoute.page),
    AutoRoute(page: UtilizationRoute.page),
    AutoRoute(page: PdfViewRoute.page),
    AutoRoute(page: ReimbursementRoute.page),
    AutoRoute(page: OtherLineRoute.page),
    AutoRoute(page: InsuranceRoute.page),
    AutoRoute(page: SickLeavePolicesRoute.page),
    AutoRoute(page: SickLeaveServiceRoute.page),
    AutoRoute(page: CreateSickLeaveRoute.page),
    AutoRoute(page: MySickLeaveRoute.page),
    AutoRoute(page: SickLeaveAnalyticsRoute.page),
    AutoRoute(page: FeedbackRoute.page),
    AutoRoute(page: SelectInsuranceRoute.page),
    AutoRoute(page: MedicalFilterRoute.page),
    AutoRoute(page: CarServiceRoute.page),
    AutoRoute(page: ReservationDashboardRoute.page),
    AutoRoute(page: UniqueServiceRoute.page),
    AutoRoute(page: SearchResultRoute.page),
    AutoRoute(page: AdditionDeletionDashboard.page),
    AutoRoute(page: SelectRequestTypeRoute.page),
    AutoRoute(page: SelectMembersToDeleteRoute.page),
    AutoRoute(page: ManualEntryRoute.page),
    AutoRoute(page: TemplateUploadRoute.page),
    AutoRoute(page: ViewTrackRequestsRoute.page),
    AutoRoute(page: SelectPoliciesRoute.page),
    AutoRoute(page: MethodSelectionRoute.page),
    AutoRoute(page: GuidelinesRoute.page),
    AutoRoute(page: DeletionGuidelinesRoute.page),
  ];
}
