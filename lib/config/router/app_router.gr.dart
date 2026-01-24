// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i6;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i10;
import 'package:bond/features/auth/presentation/pages/profile_screen.dart'
    as _i16;
import 'package:bond/features/emergency/presentation/pages/create_emergancy_screen.dart'
    as _i2;
import 'package:bond/features/emergency/presentation/pages/emergency_screen.dart'
    as _i8;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i4;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i7;
import 'package:bond/features/other_line/data/models/template_model.dart'
    as _i23;
import 'package:bond/features/other_line/presentation/pages/insurance_screen.dart'
    as _i5;
import 'package:bond/features/other_line/presentation/pages/other_line_screen.dart'
    as _i9;
import 'package:bond/features/policies/data/models/response/main_policy_model.dart'
    as _i24;
import 'package:bond/features/policies/presentation/pages/active_list_screen.dart'
    as _i1;
import 'package:bond/features/policies/presentation/pages/policies_screen.dart'
    as _i12;
import 'package:bond/features/policies/presentation/pages/policy_dashboard.dart'
    as _i13;
import 'package:bond/features/policies/presentation/pages/policy_info_screen.dart'
    as _i14;
import 'package:bond/features/policies/presentation/pages/policy_payment_screen.dart'
    as _i15;
import 'package:bond/features/policies/presentation/pages/reimbursement_screen.dart'
    as _i17;
import 'package:bond/features/policies/presentation/pages/utilization_screen.dart'
    as _i20;
import 'package:bond/features/settings/presentation/pages/complaint_screen.dart'
    as _i3;
import 'package:bond/features/settings/presentation/pages/pdf_view_screen.dart'
    as _i11;
import 'package:bond/features/settings/presentation/pages/terms_screen.dart'
    as _i19;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i18;
import 'package:flutter/material.dart' as _i22;

/// generated route for
/// [_i1.ActiveListScreen]
class ActiveListRoute extends _i21.PageRouteInfo<ActiveListRouteArgs> {
  ActiveListRoute({
    _i22.Key? key,
    required int policyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         ActiveListRoute.name,
         args: ActiveListRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ActiveListRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActiveListRouteArgs>();
      return _i1.ActiveListScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ActiveListRouteArgs {
  const ActiveListRouteArgs({this.key, required this.policyId});

  final _i22.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'ActiveListRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActiveListRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i2.AddEmergenceScreen]
class AddEmergenceRoute extends _i21.PageRouteInfo<void> {
  const AddEmergenceRoute({List<_i21.PageRouteInfo>? children})
    : super(AddEmergenceRoute.name, initialChildren: children);

  static const String name = 'AddEmergenceRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddEmergenceScreen();
    },
  );
}

/// generated route for
/// [_i3.ComplaintScreen]
class ComplaintRoute extends _i21.PageRouteInfo<void> {
  const ComplaintRoute({List<_i21.PageRouteInfo>? children})
    : super(ComplaintRoute.name, initialChildren: children);

  static const String name = 'ComplaintRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i3.ComplaintScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i21.PageRouteInfo<void> {
  const HomeRoute({List<_i21.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.InsuranceScreen]
class InsuranceRoute extends _i21.PageRouteInfo<InsuranceRouteArgs> {
  InsuranceRoute({
    _i22.Key? key,
    required String title,
    required _i23.TemplateModel templateModel,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         InsuranceRoute.name,
         args: InsuranceRouteArgs(
           key: key,
           title: title,
           templateModel: templateModel,
         ),
         initialChildren: children,
       );

  static const String name = 'InsuranceRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InsuranceRouteArgs>();
      return _i5.InsuranceScreen(
        key: args.key,
        title: args.title,
        templateModel: args.templateModel,
      );
    },
  );
}

class InsuranceRouteArgs {
  const InsuranceRouteArgs({
    this.key,
    required this.title,
    required this.templateModel,
  });

  final _i22.Key? key;

  final String title;

  final _i23.TemplateModel templateModel;

  @override
  String toString() {
    return 'InsuranceRouteArgs{key: $key, title: $title, templateModel: $templateModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InsuranceRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        templateModel == other.templateModel;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ templateModel.hashCode;
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute({List<_i21.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainLayoutScreen]
class MainLayoutRoute extends _i21.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i21.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i8.MyEmergencyScreen]
class MyEmergencyRoute extends _i21.PageRouteInfo<void> {
  const MyEmergencyRoute({List<_i21.PageRouteInfo>? children})
    : super(MyEmergencyRoute.name, initialChildren: children);

  static const String name = 'MyEmergencyRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i8.MyEmergencyScreen();
    },
  );
}

/// generated route for
/// [_i9.OtherLineScreen]
class OtherLineRoute extends _i21.PageRouteInfo<void> {
  const OtherLineRoute({List<_i21.PageRouteInfo>? children})
    : super(OtherLineRoute.name, initialChildren: children);

  static const String name = 'OtherLineRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i9.OtherLineScreen();
    },
  );
}

/// generated route for
/// [_i10.OtpLoginScreen]
class OtpLoginRoute extends _i21.PageRouteInfo<OtpLoginRouteArgs> {
  OtpLoginRoute({
    _i22.Key? key,
    required String phone,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         OtpLoginRoute.name,
         args: OtpLoginRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpLoginRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpLoginRouteArgs>();
      return _i10.OtpLoginScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpLoginRouteArgs {
  const OtpLoginRouteArgs({this.key, required this.phone});

  final _i22.Key? key;

  final String phone;

  @override
  String toString() {
    return 'OtpLoginRouteArgs{key: $key, phone: $phone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpLoginRouteArgs) return false;
    return key == other.key && phone == other.phone;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode;
}

/// generated route for
/// [_i11.PdfViewScreen]
class PdfViewRoute extends _i21.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i22.Key? key,
    required String url,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         PdfViewRoute.name,
         args: PdfViewRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'PdfViewRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewRouteArgs>();
      return _i11.PdfViewScreen(key: args.key, url: args.url);
    },
  );
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({this.key, required this.url});

  final _i22.Key? key;

  final String url;

  @override
  String toString() {
    return 'PdfViewRouteArgs{key: $key, url: $url}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PdfViewRouteArgs) return false;
    return key == other.key && url == other.url;
  }

  @override
  int get hashCode => key.hashCode ^ url.hashCode;
}

/// generated route for
/// [_i12.PoliciesScreen]
class PoliciesRoute extends _i21.PageRouteInfo<void> {
  const PoliciesRoute({List<_i21.PageRouteInfo>? children})
    : super(PoliciesRoute.name, initialChildren: children);

  static const String name = 'PoliciesRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i12.PoliciesScreen();
    },
  );
}

/// generated route for
/// [_i13.PolicyAccessSelectionScreen]
class PolicyAccessSelectionRoute
    extends _i21.PageRouteInfo<PolicyAccessSelectionRouteArgs> {
  PolicyAccessSelectionRoute({
    _i22.Key? key,
    required _i24.MainPolicyModel model,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         PolicyAccessSelectionRoute.name,
         args: PolicyAccessSelectionRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'PolicyAccessSelectionRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyAccessSelectionRouteArgs>();
      return _i13.PolicyAccessSelectionScreen(key: args.key, model: args.model);
    },
  );
}

class PolicyAccessSelectionRouteArgs {
  const PolicyAccessSelectionRouteArgs({this.key, required this.model});

  final _i22.Key? key;

  final _i24.MainPolicyModel model;

  @override
  String toString() {
    return 'PolicyAccessSelectionRouteArgs{key: $key, model: $model}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PolicyAccessSelectionRouteArgs) return false;
    return key == other.key && model == other.model;
  }

  @override
  int get hashCode => key.hashCode ^ model.hashCode;
}

/// generated route for
/// [_i14.PolicyInfoScreen]
class PolicyInfoRoute extends _i21.PageRouteInfo<PolicyInfoRouteArgs> {
  PolicyInfoRoute({
    _i22.Key? key,
    required int policyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         PolicyInfoRoute.name,
         args: PolicyInfoRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyInfoRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyInfoRouteArgs>();
      return _i14.PolicyInfoScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyInfoRouteArgs {
  const PolicyInfoRouteArgs({this.key, required this.policyId});

  final _i22.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'PolicyInfoRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PolicyInfoRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i15.PolicyPaymentScreen]
class PolicyPaymentRoute extends _i21.PageRouteInfo<PolicyPaymentRouteArgs> {
  PolicyPaymentRoute({
    _i22.Key? key,
    required int policyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         PolicyPaymentRoute.name,
         args: PolicyPaymentRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyPaymentRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyPaymentRouteArgs>();
      return _i15.PolicyPaymentScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyPaymentRouteArgs {
  const PolicyPaymentRouteArgs({this.key, required this.policyId});

  final _i22.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'PolicyPaymentRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PolicyPaymentRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i16.ProfileScreen]
class ProfileRoute extends _i21.PageRouteInfo<void> {
  const ProfileRoute({List<_i21.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i17.ReimbursementScreen]
class ReimbursementRoute extends _i21.PageRouteInfo<ReimbursementRouteArgs> {
  ReimbursementRoute({
    _i22.Key? key,
    required int policyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         ReimbursementRoute.name,
         args: ReimbursementRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ReimbursementRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReimbursementRouteArgs>();
      return _i17.ReimbursementScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ReimbursementRouteArgs {
  const ReimbursementRouteArgs({this.key, required this.policyId});

  final _i22.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'ReimbursementRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReimbursementRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i21.PageRouteInfo<void> {
  const SplashRoute({List<_i21.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i18.SplashScreen();
    },
  );
}

/// generated route for
/// [_i19.TermsScreen]
class TermsRoute extends _i21.PageRouteInfo<void> {
  const TermsRoute({List<_i21.PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i19.TermsScreen();
    },
  );
}

/// generated route for
/// [_i20.UtilizationScreen]
class UtilizationRoute extends _i21.PageRouteInfo<UtilizationRouteArgs> {
  UtilizationRoute({
    _i22.Key? key,
    required int policyId,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         UtilizationRoute.name,
         args: UtilizationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'UtilizationRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UtilizationRouteArgs>();
      return _i20.UtilizationScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class UtilizationRouteArgs {
  const UtilizationRouteArgs({this.key, required this.policyId});

  final _i22.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'UtilizationRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UtilizationRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}
