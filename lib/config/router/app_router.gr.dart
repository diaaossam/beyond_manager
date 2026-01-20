// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i4;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i7;
import 'package:bond/features/auth/presentation/pages/profile_screen.dart'
    as _i11;
import 'package:bond/features/emergency/presentation/pages/create_emergancy_screen.dart'
    as _i1;
import 'package:bond/features/emergency/presentation/pages/emergency_screen.dart'
    as _i6;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i3;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i5;
import 'package:bond/features/policies/data/models/main_policy_model.dart'
    as _i16;
import 'package:bond/features/policies/presentation/pages/policies_screen.dart'
    as _i9;
import 'package:bond/features/policies/presentation/pages/policy_dashboard.dart'
    as _i10;
import 'package:bond/features/settings/presentation/pages/complaint_screen.dart'
    as _i2;
import 'package:bond/features/settings/presentation/pages/pdf_view_screen.dart'
    as _i8;
import 'package:bond/features/settings/presentation/pages/terms_screen.dart'
    as _i13;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i12;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.AddEmergenceScreen]
class AddEmergenceRoute extends _i14.PageRouteInfo<void> {
  const AddEmergenceRoute({List<_i14.PageRouteInfo>? children})
    : super(AddEmergenceRoute.name, initialChildren: children);

  static const String name = 'AddEmergenceRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddEmergenceScreen();
    },
  );
}

/// generated route for
/// [_i2.ComplaintScreen]
class ComplaintRoute extends _i14.PageRouteInfo<void> {
  const ComplaintRoute({List<_i14.PageRouteInfo>? children})
    : super(ComplaintRoute.name, initialChildren: children);

  static const String name = 'ComplaintRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.ComplaintScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MainLayoutScreen]
class MainLayoutRoute extends _i14.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i14.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i6.MyEmergencyScreen]
class MyEmergencyRoute extends _i14.PageRouteInfo<void> {
  const MyEmergencyRoute({List<_i14.PageRouteInfo>? children})
    : super(MyEmergencyRoute.name, initialChildren: children);

  static const String name = 'MyEmergencyRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyEmergencyScreen();
    },
  );
}

/// generated route for
/// [_i7.OtpLoginScreen]
class OtpLoginRoute extends _i14.PageRouteInfo<OtpLoginRouteArgs> {
  OtpLoginRoute({
    _i15.Key? key,
    required String phone,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         OtpLoginRoute.name,
         args: OtpLoginRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpLoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpLoginRouteArgs>();
      return _i7.OtpLoginScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpLoginRouteArgs {
  const OtpLoginRouteArgs({this.key, required this.phone});

  final _i15.Key? key;

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
/// [_i8.PdfViewScreen]
class PdfViewRoute extends _i14.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i15.Key? key,
    required String url,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         PdfViewRoute.name,
         args: PdfViewRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'PdfViewRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewRouteArgs>();
      return _i8.PdfViewScreen(key: args.key, url: args.url);
    },
  );
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({this.key, required this.url});

  final _i15.Key? key;

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
/// [_i9.PoliciesScreen]
class PoliciesRoute extends _i14.PageRouteInfo<void> {
  const PoliciesRoute({List<_i14.PageRouteInfo>? children})
    : super(PoliciesRoute.name, initialChildren: children);

  static const String name = 'PoliciesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.PoliciesScreen();
    },
  );
}

/// generated route for
/// [_i10.PolicyAccessSelectionScreen]
class PolicyAccessSelectionRoute
    extends _i14.PageRouteInfo<PolicyAccessSelectionRouteArgs> {
  PolicyAccessSelectionRoute({
    _i15.Key? key,
    required _i16.MainPolicyModel model,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         PolicyAccessSelectionRoute.name,
         args: PolicyAccessSelectionRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'PolicyAccessSelectionRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyAccessSelectionRouteArgs>();
      return _i10.PolicyAccessSelectionScreen(key: args.key, model: args.model);
    },
  );
}

class PolicyAccessSelectionRouteArgs {
  const PolicyAccessSelectionRouteArgs({this.key, required this.model});

  final _i15.Key? key;

  final _i16.MainPolicyModel model;

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
/// [_i11.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.TermsScreen]
class TermsRoute extends _i14.PageRouteInfo<void> {
  const TermsRoute({List<_i14.PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TermsScreen();
    },
  );
}
