// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i37;
import 'package:bond/features/auth/presentation/pages/login_screen.dart'
    as _i12;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i20;
import 'package:bond/features/auth/presentation/pages/profile_screen.dart'
    as _i26;
import 'package:bond/features/car_service/presentation/pages/car_service_screen.dart'
    as _i4;
import 'package:bond/features/emergency/presentation/pages/create_emergancy_screen.dart'
    as _i2;
import 'package:bond/features/emergency/presentation/pages/emergency_screen.dart'
    as _i15;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i10;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i13;
import 'package:bond/features/main/presentation/pages/select_insurance_screen.dart'
    as _i29;
import 'package:bond/features/main/presentation/pages/unique_service_screen.dart'
    as _i35;
import 'package:bond/features/network/data/models/response/search_params.dart'
    as _i43;
import 'package:bond/features/network/presentation/pages/medical_filter_screen.dart'
    as _i14;
import 'package:bond/features/network/presentation/pages/search_result_screen.dart'
    as _i28;
import 'package:bond/features/other_line/data/models/template_model.dart'
    as _i41;
import 'package:bond/features/other_line/presentation/pages/insurance_screen.dart'
    as _i11;
import 'package:bond/features/other_line/presentation/pages/other_line_screen.dart'
    as _i19;
import 'package:bond/features/policies/data/models/response/main_policy_model.dart'
    as _i42;
import 'package:bond/features/policies/presentation/pages/active_list_screen.dart'
    as _i1;
import 'package:bond/features/policies/presentation/pages/policies_screen.dart'
    as _i22;
import 'package:bond/features/policies/presentation/pages/policy_dashboard.dart'
    as _i23;
import 'package:bond/features/policies/presentation/pages/policy_info_screen.dart'
    as _i24;
import 'package:bond/features/policies/presentation/pages/policy_payment_screen.dart'
    as _i25;
import 'package:bond/features/policies/presentation/pages/reimbursement_screen.dart'
    as _i27;
import 'package:bond/features/policies/presentation/pages/utilization_screen.dart'
    as _i36;
import 'package:bond/features/reservation/data/models/response/doctors_result.dart'
    as _i39;
import 'package:bond/features/reservation/presentation/pages/booking_doctor_screen.dart'
    as _i3;
import 'package:bond/features/reservation/presentation/pages/chosse_reservation_screen.dart'
    as _i5;
import 'package:bond/features/reservation/presentation/pages/doctors_result_screen.dart'
    as _i8;
import 'package:bond/features/reservation/presentation/pages/my_reservation_screen.dart'
    as _i16;
import 'package:bond/features/reservation/presentation/pages/new_reservation_screen.dart'
    as _i18;
import 'package:bond/features/settings/presentation/pages/complaint_screen.dart'
    as _i6;
import 'package:bond/features/settings/presentation/pages/pdf_view_screen.dart'
    as _i21;
import 'package:bond/features/settings/presentation/pages/terms_screen.dart'
    as _i34;
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart'
    as _i40;
import 'package:bond/features/sick_leave/presentation/pages/create_sick_leave_screen.dart'
    as _i7;
import 'package:bond/features/sick_leave/presentation/pages/feedback_screen.dart'
    as _i9;
import 'package:bond/features/sick_leave/presentation/pages/my_sick_leave_screen.dart'
    as _i17;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_analtyics.dart'
    as _i30;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_polices.dart'
    as _i31;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_service_screen.dart'
    as _i32;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i33;
import 'package:flutter/material.dart' as _i38;

/// generated route for
/// [_i1.ActiveListScreen]
class ActiveListRoute extends _i37.PageRouteInfo<ActiveListRouteArgs> {
  ActiveListRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         ActiveListRoute.name,
         args: ActiveListRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ActiveListRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActiveListRouteArgs>();
      return _i1.ActiveListScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ActiveListRouteArgs {
  const ActiveListRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

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
class AddEmergenceRoute extends _i37.PageRouteInfo<void> {
  const AddEmergenceRoute({List<_i37.PageRouteInfo>? children})
    : super(AddEmergenceRoute.name, initialChildren: children);

  static const String name = 'AddEmergenceRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddEmergenceScreen();
    },
  );
}

/// generated route for
/// [_i3.BookingDoctorScreen]
class BookingDoctorRoute extends _i37.PageRouteInfo<BookingDoctorRouteArgs> {
  BookingDoctorRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         BookingDoctorRoute.name,
         args: BookingDoctorRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'BookingDoctorRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingDoctorRouteArgs>();
      return _i3.BookingDoctorScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class BookingDoctorRouteArgs {
  const BookingDoctorRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'BookingDoctorRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingDoctorRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i4.CarServiceScreen]
class CarServiceRoute extends _i37.PageRouteInfo<void> {
  const CarServiceRoute({List<_i37.PageRouteInfo>? children})
    : super(CarServiceRoute.name, initialChildren: children);

  static const String name = 'CarServiceRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i4.CarServiceScreen();
    },
  );
}

/// generated route for
/// [_i5.ChooseReservationScreen]
class ChooseReservationRoute
    extends _i37.PageRouteInfo<ChooseReservationRouteArgs> {
  ChooseReservationRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         ChooseReservationRoute.name,
         args: ChooseReservationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ChooseReservationRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseReservationRouteArgs>();
      return _i5.ChooseReservationScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class ChooseReservationRouteArgs {
  const ChooseReservationRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'ChooseReservationRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChooseReservationRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i6.ComplaintScreen]
class ComplaintRoute extends _i37.PageRouteInfo<void> {
  const ComplaintRoute({List<_i37.PageRouteInfo>? children})
    : super(ComplaintRoute.name, initialChildren: children);

  static const String name = 'ComplaintRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i6.ComplaintScreen();
    },
  );
}

/// generated route for
/// [_i7.CreateSickLeaveScreen]
class CreateSickLeaveRoute
    extends _i37.PageRouteInfo<CreateSickLeaveRouteArgs> {
  CreateSickLeaveRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         CreateSickLeaveRoute.name,
         args: CreateSickLeaveRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'CreateSickLeaveRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateSickLeaveRouteArgs>();
      return _i7.CreateSickLeaveScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class CreateSickLeaveRouteArgs {
  const CreateSickLeaveRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'CreateSickLeaveRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateSickLeaveRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i8.DoctorsResultScreen]
class DoctorsResultRoute extends _i37.PageRouteInfo<DoctorsResultRouteArgs> {
  DoctorsResultRoute({
    _i38.Key? key,
    required int policyId,
    required _i39.DoctorsResult doctorsResult,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         DoctorsResultRoute.name,
         args: DoctorsResultRouteArgs(
           key: key,
           policyId: policyId,
           doctorsResult: doctorsResult,
         ),
         initialChildren: children,
       );

  static const String name = 'DoctorsResultRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DoctorsResultRouteArgs>();
      return _i8.DoctorsResultScreen(
        key: args.key,
        policyId: args.policyId,
        doctorsResult: args.doctorsResult,
      );
    },
  );
}

class DoctorsResultRouteArgs {
  const DoctorsResultRouteArgs({
    this.key,
    required this.policyId,
    required this.doctorsResult,
  });

  final _i38.Key? key;

  final int policyId;

  final _i39.DoctorsResult doctorsResult;

  @override
  String toString() {
    return 'DoctorsResultRouteArgs{key: $key, policyId: $policyId, doctorsResult: $doctorsResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DoctorsResultRouteArgs) return false;
    return key == other.key &&
        policyId == other.policyId &&
        doctorsResult == other.doctorsResult;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode ^ doctorsResult.hashCode;
}

/// generated route for
/// [_i9.FeedbackScreen]
class FeedbackRoute extends _i37.PageRouteInfo<FeedbackRouteArgs> {
  FeedbackRoute({
    _i38.Key? key,
    required _i40.MySickLeave myRequestsModel,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         FeedbackRoute.name,
         args: FeedbackRouteArgs(key: key, myRequestsModel: myRequestsModel),
         initialChildren: children,
       );

  static const String name = 'FeedbackRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FeedbackRouteArgs>();
      return _i9.FeedbackScreen(
        key: args.key,
        myRequestsModel: args.myRequestsModel,
      );
    },
  );
}

class FeedbackRouteArgs {
  const FeedbackRouteArgs({this.key, required this.myRequestsModel});

  final _i38.Key? key;

  final _i40.MySickLeave myRequestsModel;

  @override
  String toString() {
    return 'FeedbackRouteArgs{key: $key, myRequestsModel: $myRequestsModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FeedbackRouteArgs) return false;
    return key == other.key && myRequestsModel == other.myRequestsModel;
  }

  @override
  int get hashCode => key.hashCode ^ myRequestsModel.hashCode;
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i37.PageRouteInfo<void> {
  const HomeRoute({List<_i37.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i10.HomeScreen();
    },
  );
}

/// generated route for
/// [_i11.InsuranceScreen]
class InsuranceRoute extends _i37.PageRouteInfo<InsuranceRouteArgs> {
  InsuranceRoute({
    _i38.Key? key,
    required String title,
    required _i41.TemplateModel templateModel,
    List<_i37.PageRouteInfo>? children,
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

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InsuranceRouteArgs>();
      return _i11.InsuranceScreen(
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

  final _i38.Key? key;

  final String title;

  final _i41.TemplateModel templateModel;

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
/// [_i12.LoginScreen]
class LoginRoute extends _i37.PageRouteInfo<void> {
  const LoginRoute({List<_i37.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginScreen();
    },
  );
}

/// generated route for
/// [_i13.MainLayoutScreen]
class MainLayoutRoute extends _i37.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i37.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i13.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i14.MedicalFilterScreen]
class MedicalFilterRoute extends _i37.PageRouteInfo<void> {
  const MedicalFilterRoute({List<_i37.PageRouteInfo>? children})
    : super(MedicalFilterRoute.name, initialChildren: children);

  static const String name = 'MedicalFilterRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i14.MedicalFilterScreen();
    },
  );
}

/// generated route for
/// [_i15.MyEmergencyScreen]
class MyEmergencyRoute extends _i37.PageRouteInfo<void> {
  const MyEmergencyRoute({List<_i37.PageRouteInfo>? children})
    : super(MyEmergencyRoute.name, initialChildren: children);

  static const String name = 'MyEmergencyRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i15.MyEmergencyScreen();
    },
  );
}

/// generated route for
/// [_i16.MyReservationScreen]
class MyReservationRoute extends _i37.PageRouteInfo<MyReservationRouteArgs> {
  MyReservationRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         MyReservationRoute.name,
         args: MyReservationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'MyReservationRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyReservationRouteArgs>();
      return _i16.MyReservationScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class MyReservationRouteArgs {
  const MyReservationRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'MyReservationRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyReservationRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i17.MySickLeaveScreen]
class MySickLeaveRoute extends _i37.PageRouteInfo<MySickLeaveRouteArgs> {
  MySickLeaveRoute({
    _i38.Key? key,
    int? sickLeaveId,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         MySickLeaveRoute.name,
         args: MySickLeaveRouteArgs(
           key: key,
           sickLeaveId: sickLeaveId,
           policyId: policyId,
         ),
         initialChildren: children,
       );

  static const String name = 'MySickLeaveRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MySickLeaveRouteArgs>();
      return _i17.MySickLeaveScreen(
        key: args.key,
        sickLeaveId: args.sickLeaveId,
        policyId: args.policyId,
      );
    },
  );
}

class MySickLeaveRouteArgs {
  const MySickLeaveRouteArgs({
    this.key,
    this.sickLeaveId,
    required this.policyId,
  });

  final _i38.Key? key;

  final int? sickLeaveId;

  final int policyId;

  @override
  String toString() {
    return 'MySickLeaveRouteArgs{key: $key, sickLeaveId: $sickLeaveId, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MySickLeaveRouteArgs) return false;
    return key == other.key &&
        sickLeaveId == other.sickLeaveId &&
        policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ sickLeaveId.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i18.NewReservationScreen]
class NewReservationRoute extends _i37.PageRouteInfo<NewReservationRouteArgs> {
  NewReservationRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         NewReservationRoute.name,
         args: NewReservationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'NewReservationRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewReservationRouteArgs>();
      return _i18.NewReservationScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class NewReservationRouteArgs {
  const NewReservationRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'NewReservationRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewReservationRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i19.OtherLineScreen]
class OtherLineRoute extends _i37.PageRouteInfo<void> {
  const OtherLineRoute({List<_i37.PageRouteInfo>? children})
    : super(OtherLineRoute.name, initialChildren: children);

  static const String name = 'OtherLineRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i19.OtherLineScreen();
    },
  );
}

/// generated route for
/// [_i20.OtpLoginScreen]
class OtpLoginRoute extends _i37.PageRouteInfo<OtpLoginRouteArgs> {
  OtpLoginRoute({
    _i38.Key? key,
    required String phone,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         OtpLoginRoute.name,
         args: OtpLoginRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpLoginRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpLoginRouteArgs>();
      return _i20.OtpLoginScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpLoginRouteArgs {
  const OtpLoginRouteArgs({this.key, required this.phone});

  final _i38.Key? key;

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
/// [_i21.PdfViewScreen]
class PdfViewRoute extends _i37.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i38.Key? key,
    required String url,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         PdfViewRoute.name,
         args: PdfViewRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'PdfViewRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewRouteArgs>();
      return _i21.PdfViewScreen(key: args.key, url: args.url);
    },
  );
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({this.key, required this.url});

  final _i38.Key? key;

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
/// [_i22.PoliciesScreen]
class PoliciesRoute extends _i37.PageRouteInfo<void> {
  const PoliciesRoute({List<_i37.PageRouteInfo>? children})
    : super(PoliciesRoute.name, initialChildren: children);

  static const String name = 'PoliciesRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i22.PoliciesScreen();
    },
  );
}

/// generated route for
/// [_i23.PolicyAccessSelectionScreen]
class PolicyAccessSelectionRoute
    extends _i37.PageRouteInfo<PolicyAccessSelectionRouteArgs> {
  PolicyAccessSelectionRoute({
    _i38.Key? key,
    required _i42.MainPolicyModel model,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         PolicyAccessSelectionRoute.name,
         args: PolicyAccessSelectionRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'PolicyAccessSelectionRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyAccessSelectionRouteArgs>();
      return _i23.PolicyAccessSelectionScreen(key: args.key, model: args.model);
    },
  );
}

class PolicyAccessSelectionRouteArgs {
  const PolicyAccessSelectionRouteArgs({this.key, required this.model});

  final _i38.Key? key;

  final _i42.MainPolicyModel model;

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
/// [_i24.PolicyInfoScreen]
class PolicyInfoRoute extends _i37.PageRouteInfo<PolicyInfoRouteArgs> {
  PolicyInfoRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         PolicyInfoRoute.name,
         args: PolicyInfoRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyInfoRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyInfoRouteArgs>();
      return _i24.PolicyInfoScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyInfoRouteArgs {
  const PolicyInfoRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

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
/// [_i25.PolicyPaymentScreen]
class PolicyPaymentRoute extends _i37.PageRouteInfo<PolicyPaymentRouteArgs> {
  PolicyPaymentRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         PolicyPaymentRoute.name,
         args: PolicyPaymentRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyPaymentRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyPaymentRouteArgs>();
      return _i25.PolicyPaymentScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyPaymentRouteArgs {
  const PolicyPaymentRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

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
/// [_i26.ProfileScreen]
class ProfileRoute extends _i37.PageRouteInfo<void> {
  const ProfileRoute({List<_i37.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i26.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i27.ReimbursementScreen]
class ReimbursementRoute extends _i37.PageRouteInfo<ReimbursementRouteArgs> {
  ReimbursementRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         ReimbursementRoute.name,
         args: ReimbursementRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ReimbursementRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReimbursementRouteArgs>();
      return _i27.ReimbursementScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ReimbursementRouteArgs {
  const ReimbursementRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

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
/// [_i28.SearchResultScreen]
class SearchResultRoute extends _i37.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i38.Key? key,
    required _i43.SearchParamsModel searchParamsModel,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         SearchResultRoute.name,
         args: SearchResultRouteArgs(
           key: key,
           searchParamsModel: searchParamsModel,
         ),
         initialChildren: children,
       );

  static const String name = 'SearchResultRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultRouteArgs>();
      return _i28.SearchResultScreen(
        key: args.key,
        searchParamsModel: args.searchParamsModel,
      );
    },
  );
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({this.key, required this.searchParamsModel});

  final _i38.Key? key;

  final _i43.SearchParamsModel searchParamsModel;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, searchParamsModel: $searchParamsModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchResultRouteArgs) return false;
    return key == other.key && searchParamsModel == other.searchParamsModel;
  }

  @override
  int get hashCode => key.hashCode ^ searchParamsModel.hashCode;
}

/// generated route for
/// [_i29.SelectInsuranceScreen]
class SelectInsuranceRoute extends _i37.PageRouteInfo<void> {
  const SelectInsuranceRoute({List<_i37.PageRouteInfo>? children})
    : super(SelectInsuranceRoute.name, initialChildren: children);

  static const String name = 'SelectInsuranceRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i29.SelectInsuranceScreen();
    },
  );
}

/// generated route for
/// [_i30.SickLeaveAnalyticsScreen]
class SickLeaveAnalyticsRoute
    extends _i37.PageRouteInfo<SickLeaveAnalyticsRouteArgs> {
  SickLeaveAnalyticsRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         SickLeaveAnalyticsRoute.name,
         args: SickLeaveAnalyticsRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'SickLeaveAnalyticsRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SickLeaveAnalyticsRouteArgs>();
      return _i30.SickLeaveAnalyticsScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class SickLeaveAnalyticsRouteArgs {
  const SickLeaveAnalyticsRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'SickLeaveAnalyticsRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SickLeaveAnalyticsRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i31.SickLeavePolicesScreen]
class SickLeavePolicesRoute extends _i37.PageRouteInfo<void> {
  const SickLeavePolicesRoute({List<_i37.PageRouteInfo>? children})
    : super(SickLeavePolicesRoute.name, initialChildren: children);

  static const String name = 'SickLeavePolicesRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i31.SickLeavePolicesScreen();
    },
  );
}

/// generated route for
/// [_i32.SickLeaveServiceScreen]
class SickLeaveServiceRoute
    extends _i37.PageRouteInfo<SickLeaveServiceRouteArgs> {
  SickLeaveServiceRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         SickLeaveServiceRoute.name,
         args: SickLeaveServiceRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'SickLeaveServiceRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SickLeaveServiceRouteArgs>();
      return _i32.SickLeaveServiceScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class SickLeaveServiceRouteArgs {
  const SickLeaveServiceRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'SickLeaveServiceRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SickLeaveServiceRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i33.SplashScreen]
class SplashRoute extends _i37.PageRouteInfo<void> {
  const SplashRoute({List<_i37.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i33.SplashScreen();
    },
  );
}

/// generated route for
/// [_i34.TermsScreen]
class TermsRoute extends _i37.PageRouteInfo<void> {
  const TermsRoute({List<_i37.PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i34.TermsScreen();
    },
  );
}

/// generated route for
/// [_i35.UniqueServiceScreen]
class UniqueServiceRoute extends _i37.PageRouteInfo<void> {
  const UniqueServiceRoute({List<_i37.PageRouteInfo>? children})
    : super(UniqueServiceRoute.name, initialChildren: children);

  static const String name = 'UniqueServiceRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      return const _i35.UniqueServiceScreen();
    },
  );
}

/// generated route for
/// [_i36.UtilizationScreen]
class UtilizationRoute extends _i37.PageRouteInfo<UtilizationRouteArgs> {
  UtilizationRoute({
    _i38.Key? key,
    required int policyId,
    List<_i37.PageRouteInfo>? children,
  }) : super(
         UtilizationRoute.name,
         args: UtilizationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'UtilizationRoute';

  static _i37.PageInfo page = _i37.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UtilizationRouteArgs>();
      return _i36.UtilizationScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class UtilizationRouteArgs {
  const UtilizationRouteArgs({this.key, required this.policyId});

  final _i38.Key? key;

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
