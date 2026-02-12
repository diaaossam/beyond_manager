// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i50;
import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart'
    as _i60;
import 'package:bond/features/addation_deletion/presentation/pages/addation_deletion_dashboard.dart'
    as _i3;
import 'package:bond/features/addation_deletion/presentation/pages/deletion_guidelines_screen.dart'
    as _i10;
import 'package:bond/features/addation_deletion/presentation/pages/guidelines_screen.dart'
    as _i13;
import 'package:bond/features/addation_deletion/presentation/pages/manual_entry_screen.dart'
    as _i18;
import 'package:bond/features/addation_deletion/presentation/pages/method_selection_screen.dart'
    as _i20;
import 'package:bond/features/addation_deletion/presentation/pages/select_members_to_delete_screen.dart'
    as _i36;
import 'package:bond/features/addation_deletion/presentation/pages/select_policies_screen.dart'
    as _i37;
import 'package:bond/features/addation_deletion/presentation/pages/select_request_type_screen.dart'
    as _i38;
import 'package:bond/features/addation_deletion/presentation/pages/template_upload_screen.dart'
    as _i43;
import 'package:bond/features/addation_deletion/presentation/pages/view_track_requests_screen.dart'
    as _i49;
import 'package:bond/features/auth/presentation/pages/login_screen.dart'
    as _i16;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i25;
import 'package:bond/features/auth/presentation/pages/profile_screen.dart'
    as _i31;
import 'package:bond/features/car_service/data/models/company_model.dart'
    as _i55;
import 'package:bond/features/car_service/data/models/service_center_model.dart'
    as _i54;
import 'package:bond/features/car_service/presentation/pages/car_service_result.dart'
    as _i5;
import 'package:bond/features/car_service/presentation/pages/car_service_screen.dart'
    as _i6;
import 'package:bond/features/emergency/presentation/pages/create_emergancy_screen.dart'
    as _i2;
import 'package:bond/features/emergency/presentation/pages/emergency_screen.dart'
    as _i21;
import 'package:bond/features/hr_access/presentation/pages/create_hr_access_screen.dart'
    as _i8;
import 'package:bond/features/hr_access/presentation/pages/update_existing_manager_screen.dart'
    as _i46;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i14;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i17;
import 'package:bond/features/main/presentation/pages/select_insurance_screen.dart'
    as _i35;
import 'package:bond/features/main/presentation/pages/unique_service_screen.dart'
    as _i45;
import 'package:bond/features/network/data/models/response/search_params.dart'
    as _i62;
import 'package:bond/features/network/presentation/pages/medical_filter_screen.dart'
    as _i19;
import 'package:bond/features/network/presentation/pages/search_result_screen.dart'
    as _i34;
import 'package:bond/features/other_line/data/models/template_model.dart'
    as _i59;
import 'package:bond/features/other_line/presentation/pages/insurance_screen.dart'
    as _i15;
import 'package:bond/features/other_line/presentation/pages/other_line_screen.dart'
    as _i24;
import 'package:bond/features/policies/data/models/response/main_policy_model.dart'
    as _i61;
import 'package:bond/features/policies/presentation/pages/active_list_screen.dart'
    as _i1;
import 'package:bond/features/policies/presentation/pages/policies_screen.dart'
    as _i27;
import 'package:bond/features/policies/presentation/pages/policy_dashboard.dart'
    as _i28;
import 'package:bond/features/policies/presentation/pages/policy_info_screen.dart'
    as _i29;
import 'package:bond/features/policies/presentation/pages/policy_payment_screen.dart'
    as _i30;
import 'package:bond/features/policies/presentation/pages/reimbursement_screen.dart'
    as _i32;
import 'package:bond/features/policies/presentation/pages/utilization_notifications_screen.dart'
    as _i47;
import 'package:bond/features/policies/presentation/pages/utilization_screen.dart'
    as _i48;
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart'
    as _i52;
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart'
    as _i57;
import 'package:bond/features/reservation/data/models/response/doctors_result.dart'
    as _i53;
import 'package:bond/features/reservation/presentation/pages/booking_doctor_screen.dart'
    as _i4;
import 'package:bond/features/reservation/presentation/pages/doctors_result_screen.dart'
    as _i11;
import 'package:bond/features/reservation/presentation/pages/new_reservation_screen.dart'
    as _i23;
import 'package:bond/features/reservation/presentation/pages/reservation_dashboard_screen.dart'
    as _i33;
import 'package:bond/features/settings/presentation/pages/complaint_screen.dart'
    as _i7;
import 'package:bond/features/settings/presentation/pages/pdf_view_screen.dart'
    as _i26;
import 'package:bond/features/settings/presentation/pages/terms_screen.dart'
    as _i44;
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart'
    as _i58;
import 'package:bond/features/sick_leave/presentation/pages/create_sick_leave_screen.dart'
    as _i9;
import 'package:bond/features/sick_leave/presentation/pages/feedback_screen.dart'
    as _i12;
import 'package:bond/features/sick_leave/presentation/pages/my_sick_leave_screen.dart'
    as _i22;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_analtyics.dart'
    as _i39;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_polices.dart'
    as _i40;
import 'package:bond/features/sick_leave/presentation/pages/sick_leave_service_screen.dart'
    as _i41;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i42;
import 'package:collection/collection.dart' as _i56;
import 'package:flutter/material.dart' as _i51;

/// generated route for
/// [_i1.ActiveListScreen]
class ActiveListRoute extends _i50.PageRouteInfo<ActiveListRouteArgs> {
  ActiveListRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         ActiveListRoute.name,
         args: ActiveListRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ActiveListRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActiveListRouteArgs>();
      return _i1.ActiveListScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ActiveListRouteArgs {
  const ActiveListRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
class AddEmergenceRoute extends _i50.PageRouteInfo<void> {
  const AddEmergenceRoute({List<_i50.PageRouteInfo>? children})
    : super(AddEmergenceRoute.name, initialChildren: children);

  static const String name = 'AddEmergenceRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddEmergenceScreen();
    },
  );
}

/// generated route for
/// [_i3.AdditionDeletionDashboard]
class AdditionDeletionDashboard extends _i50.PageRouteInfo<void> {
  const AdditionDeletionDashboard({List<_i50.PageRouteInfo>? children})
    : super(AdditionDeletionDashboard.name, initialChildren: children);

  static const String name = 'AdditionDeletionDashboard';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i3.AdditionDeletionDashboard();
    },
  );
}

/// generated route for
/// [_i4.BookingDoctorScreen]
class BookingDoctorRoute extends _i50.PageRouteInfo<BookingDoctorRouteArgs> {
  BookingDoctorRoute({
    _i51.Key? key,
    required _i52.ReservationParams reservationParams,
    required _i53.DoctorsResult doctorsResult,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         BookingDoctorRoute.name,
         args: BookingDoctorRouteArgs(
           key: key,
           reservationParams: reservationParams,
           doctorsResult: doctorsResult,
         ),
         initialChildren: children,
       );

  static const String name = 'BookingDoctorRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingDoctorRouteArgs>();
      return _i4.BookingDoctorScreen(
        key: args.key,
        reservationParams: args.reservationParams,
        doctorsResult: args.doctorsResult,
      );
    },
  );
}

class BookingDoctorRouteArgs {
  const BookingDoctorRouteArgs({
    this.key,
    required this.reservationParams,
    required this.doctorsResult,
  });

  final _i51.Key? key;

  final _i52.ReservationParams reservationParams;

  final _i53.DoctorsResult doctorsResult;

  @override
  String toString() {
    return 'BookingDoctorRouteArgs{key: $key, reservationParams: $reservationParams, doctorsResult: $doctorsResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingDoctorRouteArgs) return false;
    return key == other.key &&
        reservationParams == other.reservationParams &&
        doctorsResult == other.doctorsResult;
  }

  @override
  int get hashCode =>
      key.hashCode ^ reservationParams.hashCode ^ doctorsResult.hashCode;
}

/// generated route for
/// [_i5.CarServiceResult]
class CarServiceResult extends _i50.PageRouteInfo<CarServiceResultArgs> {
  CarServiceResult({
    _i51.Key? key,
    required List<_i54.ServiceCenterModel> list,
    required _i55.CompanyModel companyModel,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         CarServiceResult.name,
         args: CarServiceResultArgs(
           key: key,
           list: list,
           companyModel: companyModel,
         ),
         initialChildren: children,
       );

  static const String name = 'CarServiceResult';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CarServiceResultArgs>();
      return _i5.CarServiceResult(
        key: args.key,
        list: args.list,
        companyModel: args.companyModel,
      );
    },
  );
}

class CarServiceResultArgs {
  const CarServiceResultArgs({
    this.key,
    required this.list,
    required this.companyModel,
  });

  final _i51.Key? key;

  final List<_i54.ServiceCenterModel> list;

  final _i55.CompanyModel companyModel;

  @override
  String toString() {
    return 'CarServiceResultArgs{key: $key, list: $list, companyModel: $companyModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CarServiceResultArgs) return false;
    return key == other.key &&
        const _i56.ListEquality<_i54.ServiceCenterModel>().equals(
          list,
          other.list,
        ) &&
        companyModel == other.companyModel;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i56.ListEquality<_i54.ServiceCenterModel>().hash(list) ^
      companyModel.hashCode;
}

/// generated route for
/// [_i6.CarServiceScreen]
class CarServiceRoute extends _i50.PageRouteInfo<void> {
  const CarServiceRoute({List<_i50.PageRouteInfo>? children})
    : super(CarServiceRoute.name, initialChildren: children);

  static const String name = 'CarServiceRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i6.CarServiceScreen();
    },
  );
}

/// generated route for
/// [_i7.ComplaintScreen]
class ComplaintRoute extends _i50.PageRouteInfo<void> {
  const ComplaintRoute({List<_i50.PageRouteInfo>? children})
    : super(ComplaintRoute.name, initialChildren: children);

  static const String name = 'ComplaintRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i7.ComplaintScreen();
    },
  );
}

/// generated route for
/// [_i8.CreateHrAccessScreen]
class CreateHrAccessRoute extends _i50.PageRouteInfo<void> {
  const CreateHrAccessRoute({List<_i50.PageRouteInfo>? children})
    : super(CreateHrAccessRoute.name, initialChildren: children);

  static const String name = 'CreateHrAccessRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i8.CreateHrAccessScreen();
    },
  );
}

/// generated route for
/// [_i9.CreateSickLeaveScreen]
class CreateSickLeaveRoute
    extends _i50.PageRouteInfo<CreateSickLeaveRouteArgs> {
  CreateSickLeaveRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         CreateSickLeaveRoute.name,
         args: CreateSickLeaveRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'CreateSickLeaveRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateSickLeaveRouteArgs>();
      return _i9.CreateSickLeaveScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class CreateSickLeaveRouteArgs {
  const CreateSickLeaveRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i10.DeletionGuidelinesScreen]
class DeletionGuidelinesRoute extends _i50.PageRouteInfo<void> {
  const DeletionGuidelinesRoute({List<_i50.PageRouteInfo>? children})
    : super(DeletionGuidelinesRoute.name, initialChildren: children);

  static const String name = 'DeletionGuidelinesRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i10.DeletionGuidelinesScreen();
    },
  );
}

/// generated route for
/// [_i11.DoctorsResultScreen]
class DoctorsResultRoute extends _i50.PageRouteInfo<DoctorsResultRouteArgs> {
  DoctorsResultRoute({
    _i51.Key? key,
    required List<_i53.DoctorsResult> allTimeSlot,
    required _i57.DoctorBookingParams params,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         DoctorsResultRoute.name,
         args: DoctorsResultRouteArgs(
           key: key,
           allTimeSlot: allTimeSlot,
           params: params,
         ),
         initialChildren: children,
       );

  static const String name = 'DoctorsResultRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DoctorsResultRouteArgs>();
      return _i11.DoctorsResultScreen(
        key: args.key,
        allTimeSlot: args.allTimeSlot,
        params: args.params,
      );
    },
  );
}

class DoctorsResultRouteArgs {
  const DoctorsResultRouteArgs({
    this.key,
    required this.allTimeSlot,
    required this.params,
  });

  final _i51.Key? key;

  final List<_i53.DoctorsResult> allTimeSlot;

  final _i57.DoctorBookingParams params;

  @override
  String toString() {
    return 'DoctorsResultRouteArgs{key: $key, allTimeSlot: $allTimeSlot, params: $params}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DoctorsResultRouteArgs) return false;
    return key == other.key &&
        const _i56.ListEquality<_i53.DoctorsResult>().equals(
          allTimeSlot,
          other.allTimeSlot,
        ) &&
        params == other.params;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i56.ListEquality<_i53.DoctorsResult>().hash(allTimeSlot) ^
      params.hashCode;
}

/// generated route for
/// [_i12.FeedbackScreen]
class FeedbackRoute extends _i50.PageRouteInfo<FeedbackRouteArgs> {
  FeedbackRoute({
    _i51.Key? key,
    required _i58.MySickLeave myRequestsModel,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         FeedbackRoute.name,
         args: FeedbackRouteArgs(key: key, myRequestsModel: myRequestsModel),
         initialChildren: children,
       );

  static const String name = 'FeedbackRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FeedbackRouteArgs>();
      return _i12.FeedbackScreen(
        key: args.key,
        myRequestsModel: args.myRequestsModel,
      );
    },
  );
}

class FeedbackRouteArgs {
  const FeedbackRouteArgs({this.key, required this.myRequestsModel});

  final _i51.Key? key;

  final _i58.MySickLeave myRequestsModel;

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
/// [_i13.GuidelinesScreen]
class GuidelinesRoute extends _i50.PageRouteInfo<void> {
  const GuidelinesRoute({List<_i50.PageRouteInfo>? children})
    : super(GuidelinesRoute.name, initialChildren: children);

  static const String name = 'GuidelinesRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i13.GuidelinesScreen();
    },
  );
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i50.PageRouteInfo<void> {
  const HomeRoute({List<_i50.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i14.HomeScreen();
    },
  );
}

/// generated route for
/// [_i15.InsuranceScreen]
class InsuranceRoute extends _i50.PageRouteInfo<InsuranceRouteArgs> {
  InsuranceRoute({
    _i51.Key? key,
    required String title,
    required _i59.TemplateModel templateModel,
    List<_i50.PageRouteInfo>? children,
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

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InsuranceRouteArgs>();
      return _i15.InsuranceScreen(
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

  final _i51.Key? key;

  final String title;

  final _i59.TemplateModel templateModel;

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
/// [_i16.LoginScreen]
class LoginRoute extends _i50.PageRouteInfo<void> {
  const LoginRoute({List<_i50.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i16.LoginScreen();
    },
  );
}

/// generated route for
/// [_i17.MainLayoutScreen]
class MainLayoutRoute extends _i50.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i50.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i17.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i18.ManualEntryScreen]
class ManualEntryRoute extends _i50.PageRouteInfo<ManualEntryRouteArgs> {
  ManualEntryRoute({
    _i51.Key? key,
    required String requestType,
    required List<_i60.PoliciesDataModel> selectedPolicies,
    required List<num> policyIds,
    required _i60.PoliciesDataModel policiesPermission,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         ManualEntryRoute.name,
         args: ManualEntryRouteArgs(
           key: key,
           requestType: requestType,
           selectedPolicies: selectedPolicies,
           policyIds: policyIds,
           policiesPermission: policiesPermission,
         ),
         initialChildren: children,
       );

  static const String name = 'ManualEntryRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ManualEntryRouteArgs>();
      return _i18.ManualEntryScreen(
        key: args.key,
        requestType: args.requestType,
        selectedPolicies: args.selectedPolicies,
        policyIds: args.policyIds,
        policiesPermission: args.policiesPermission,
      );
    },
  );
}

class ManualEntryRouteArgs {
  const ManualEntryRouteArgs({
    this.key,
    required this.requestType,
    required this.selectedPolicies,
    required this.policyIds,
    required this.policiesPermission,
  });

  final _i51.Key? key;

  final String requestType;

  final List<_i60.PoliciesDataModel> selectedPolicies;

  final List<num> policyIds;

  final _i60.PoliciesDataModel policiesPermission;

  @override
  String toString() {
    return 'ManualEntryRouteArgs{key: $key, requestType: $requestType, selectedPolicies: $selectedPolicies, policyIds: $policyIds, policiesPermission: $policiesPermission}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManualEntryRouteArgs) return false;
    return key == other.key &&
        requestType == other.requestType &&
        const _i56.ListEquality<_i60.PoliciesDataModel>().equals(
          selectedPolicies,
          other.selectedPolicies,
        ) &&
        const _i56.ListEquality<num>().equals(policyIds, other.policyIds) &&
        policiesPermission == other.policiesPermission;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      requestType.hashCode ^
      const _i56.ListEquality<_i60.PoliciesDataModel>().hash(selectedPolicies) ^
      const _i56.ListEquality<num>().hash(policyIds) ^
      policiesPermission.hashCode;
}

/// generated route for
/// [_i19.MedicalFilterScreen]
class MedicalFilterRoute extends _i50.PageRouteInfo<void> {
  const MedicalFilterRoute({List<_i50.PageRouteInfo>? children})
    : super(MedicalFilterRoute.name, initialChildren: children);

  static const String name = 'MedicalFilterRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i19.MedicalFilterScreen();
    },
  );
}

/// generated route for
/// [_i20.MethodSelectionScreen]
class MethodSelectionRoute
    extends _i50.PageRouteInfo<MethodSelectionRouteArgs> {
  MethodSelectionRoute({
    _i51.Key? key,
    required List<_i60.PoliciesDataModel> selectedPolicies,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         MethodSelectionRoute.name,
         args: MethodSelectionRouteArgs(
           key: key,
           selectedPolicies: selectedPolicies,
         ),
         initialChildren: children,
       );

  static const String name = 'MethodSelectionRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MethodSelectionRouteArgs>();
      return _i20.MethodSelectionScreen(
        key: args.key,
        selectedPolicies: args.selectedPolicies,
      );
    },
  );
}

class MethodSelectionRouteArgs {
  const MethodSelectionRouteArgs({this.key, required this.selectedPolicies});

  final _i51.Key? key;

  final List<_i60.PoliciesDataModel> selectedPolicies;

  @override
  String toString() {
    return 'MethodSelectionRouteArgs{key: $key, selectedPolicies: $selectedPolicies}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MethodSelectionRouteArgs) return false;
    return key == other.key &&
        const _i56.ListEquality<_i60.PoliciesDataModel>().equals(
          selectedPolicies,
          other.selectedPolicies,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i56.ListEquality<_i60.PoliciesDataModel>().hash(selectedPolicies);
}

/// generated route for
/// [_i21.MyEmergencyScreen]
class MyEmergencyRoute extends _i50.PageRouteInfo<void> {
  const MyEmergencyRoute({List<_i50.PageRouteInfo>? children})
    : super(MyEmergencyRoute.name, initialChildren: children);

  static const String name = 'MyEmergencyRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i21.MyEmergencyScreen();
    },
  );
}

/// generated route for
/// [_i22.MySickLeaveScreen]
class MySickLeaveRoute extends _i50.PageRouteInfo<MySickLeaveRouteArgs> {
  MySickLeaveRoute({
    _i51.Key? key,
    int? sickLeaveId,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
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

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MySickLeaveRouteArgs>();
      return _i22.MySickLeaveScreen(
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

  final _i51.Key? key;

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
/// [_i23.NewReservationScreen]
class NewReservationRoute extends _i50.PageRouteInfo<NewReservationRouteArgs> {
  NewReservationRoute({
    _i51.Key? key,
    bool isFilter = false,
    _i57.DoctorBookingParams? params,
    List<_i53.DoctorsResult>? list,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         NewReservationRoute.name,
         args: NewReservationRouteArgs(
           key: key,
           isFilter: isFilter,
           params: params,
           list: list,
         ),
         initialChildren: children,
       );

  static const String name = 'NewReservationRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewReservationRouteArgs>(
        orElse: () => const NewReservationRouteArgs(),
      );
      return _i23.NewReservationScreen(
        key: args.key,
        isFilter: args.isFilter,
        params: args.params,
        list: args.list,
      );
    },
  );
}

class NewReservationRouteArgs {
  const NewReservationRouteArgs({
    this.key,
    this.isFilter = false,
    this.params,
    this.list,
  });

  final _i51.Key? key;

  final bool isFilter;

  final _i57.DoctorBookingParams? params;

  final List<_i53.DoctorsResult>? list;

  @override
  String toString() {
    return 'NewReservationRouteArgs{key: $key, isFilter: $isFilter, params: $params, list: $list}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewReservationRouteArgs) return false;
    return key == other.key &&
        isFilter == other.isFilter &&
        params == other.params &&
        const _i56.ListEquality<_i53.DoctorsResult>().equals(list, other.list);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      isFilter.hashCode ^
      params.hashCode ^
      const _i56.ListEquality<_i53.DoctorsResult>().hash(list);
}

/// generated route for
/// [_i24.OtherLineScreen]
class OtherLineRoute extends _i50.PageRouteInfo<void> {
  const OtherLineRoute({List<_i50.PageRouteInfo>? children})
    : super(OtherLineRoute.name, initialChildren: children);

  static const String name = 'OtherLineRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i24.OtherLineScreen();
    },
  );
}

/// generated route for
/// [_i25.OtpLoginScreen]
class OtpLoginRoute extends _i50.PageRouteInfo<OtpLoginRouteArgs> {
  OtpLoginRoute({
    _i51.Key? key,
    required String phone,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         OtpLoginRoute.name,
         args: OtpLoginRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpLoginRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpLoginRouteArgs>();
      return _i25.OtpLoginScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpLoginRouteArgs {
  const OtpLoginRouteArgs({this.key, required this.phone});

  final _i51.Key? key;

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
/// [_i26.PdfViewScreen]
class PdfViewRoute extends _i50.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i51.Key? key,
    required String url,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         PdfViewRoute.name,
         args: PdfViewRouteArgs(key: key, url: url),
         initialChildren: children,
       );

  static const String name = 'PdfViewRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewRouteArgs>();
      return _i26.PdfViewScreen(key: args.key, url: args.url);
    },
  );
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({this.key, required this.url});

  final _i51.Key? key;

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
/// [_i27.PoliciesScreen]
class PoliciesRoute extends _i50.PageRouteInfo<void> {
  const PoliciesRoute({List<_i50.PageRouteInfo>? children})
    : super(PoliciesRoute.name, initialChildren: children);

  static const String name = 'PoliciesRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i27.PoliciesScreen();
    },
  );
}

/// generated route for
/// [_i28.PolicyAccessSelectionScreen]
class PolicyAccessSelectionRoute
    extends _i50.PageRouteInfo<PolicyAccessSelectionRouteArgs> {
  PolicyAccessSelectionRoute({
    _i51.Key? key,
    required _i61.MainPolicyModel model,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         PolicyAccessSelectionRoute.name,
         args: PolicyAccessSelectionRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'PolicyAccessSelectionRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyAccessSelectionRouteArgs>();
      return _i28.PolicyAccessSelectionScreen(key: args.key, model: args.model);
    },
  );
}

class PolicyAccessSelectionRouteArgs {
  const PolicyAccessSelectionRouteArgs({this.key, required this.model});

  final _i51.Key? key;

  final _i61.MainPolicyModel model;

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
/// [_i29.PolicyInfoScreen]
class PolicyInfoRoute extends _i50.PageRouteInfo<PolicyInfoRouteArgs> {
  PolicyInfoRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         PolicyInfoRoute.name,
         args: PolicyInfoRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyInfoRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyInfoRouteArgs>();
      return _i29.PolicyInfoScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyInfoRouteArgs {
  const PolicyInfoRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i30.PolicyPaymentScreen]
class PolicyPaymentRoute extends _i50.PageRouteInfo<PolicyPaymentRouteArgs> {
  PolicyPaymentRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         PolicyPaymentRoute.name,
         args: PolicyPaymentRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'PolicyPaymentRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PolicyPaymentRouteArgs>();
      return _i30.PolicyPaymentScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class PolicyPaymentRouteArgs {
  const PolicyPaymentRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i31.ProfileScreen]
class ProfileRoute extends _i50.PageRouteInfo<void> {
  const ProfileRoute({List<_i50.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i31.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i32.ReimbursementScreen]
class ReimbursementRoute extends _i50.PageRouteInfo<ReimbursementRouteArgs> {
  ReimbursementRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         ReimbursementRoute.name,
         args: ReimbursementRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'ReimbursementRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReimbursementRouteArgs>();
      return _i32.ReimbursementScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class ReimbursementRouteArgs {
  const ReimbursementRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i33.ReservationDashboardScreen]
class ReservationDashboardRoute extends _i50.PageRouteInfo<void> {
  const ReservationDashboardRoute({List<_i50.PageRouteInfo>? children})
    : super(ReservationDashboardRoute.name, initialChildren: children);

  static const String name = 'ReservationDashboardRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i33.ReservationDashboardScreen();
    },
  );
}

/// generated route for
/// [_i34.SearchResultScreen]
class SearchResultRoute extends _i50.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i51.Key? key,
    required _i62.SearchParamsModel searchParamsModel,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         SearchResultRoute.name,
         args: SearchResultRouteArgs(
           key: key,
           searchParamsModel: searchParamsModel,
         ),
         initialChildren: children,
       );

  static const String name = 'SearchResultRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultRouteArgs>();
      return _i34.SearchResultScreen(
        key: args.key,
        searchParamsModel: args.searchParamsModel,
      );
    },
  );
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({this.key, required this.searchParamsModel});

  final _i51.Key? key;

  final _i62.SearchParamsModel searchParamsModel;

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
/// [_i35.SelectInsuranceScreen]
class SelectInsuranceRoute extends _i50.PageRouteInfo<void> {
  const SelectInsuranceRoute({List<_i50.PageRouteInfo>? children})
    : super(SelectInsuranceRoute.name, initialChildren: children);

  static const String name = 'SelectInsuranceRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i35.SelectInsuranceScreen();
    },
  );
}

/// generated route for
/// [_i36.SelectMembersToDeleteScreen]
class SelectMembersToDeleteRoute
    extends _i50.PageRouteInfo<SelectMembersToDeleteRouteArgs> {
  SelectMembersToDeleteRoute({
    _i51.Key? key,
    required List<_i60.PoliciesDataModel> selectedPolicies,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         SelectMembersToDeleteRoute.name,
         args: SelectMembersToDeleteRouteArgs(
           key: key,
           selectedPolicies: selectedPolicies,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectMembersToDeleteRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectMembersToDeleteRouteArgs>();
      return _i36.SelectMembersToDeleteScreen(
        key: args.key,
        selectedPolicies: args.selectedPolicies,
      );
    },
  );
}

class SelectMembersToDeleteRouteArgs {
  const SelectMembersToDeleteRouteArgs({
    this.key,
    required this.selectedPolicies,
  });

  final _i51.Key? key;

  final List<_i60.PoliciesDataModel> selectedPolicies;

  @override
  String toString() {
    return 'SelectMembersToDeleteRouteArgs{key: $key, selectedPolicies: $selectedPolicies}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SelectMembersToDeleteRouteArgs) return false;
    return key == other.key &&
        const _i56.ListEquality<_i60.PoliciesDataModel>().equals(
          selectedPolicies,
          other.selectedPolicies,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i56.ListEquality<_i60.PoliciesDataModel>().hash(selectedPolicies);
}

/// generated route for
/// [_i37.SelectPoliciesScreen]
class SelectPoliciesRoute extends _i50.PageRouteInfo<void> {
  const SelectPoliciesRoute({List<_i50.PageRouteInfo>? children})
    : super(SelectPoliciesRoute.name, initialChildren: children);

  static const String name = 'SelectPoliciesRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i37.SelectPoliciesScreen();
    },
  );
}

/// generated route for
/// [_i38.SelectRequestTypeScreen]
class SelectRequestTypeRoute
    extends _i50.PageRouteInfo<SelectRequestTypeRouteArgs> {
  SelectRequestTypeRoute({
    _i51.Key? key,
    required List<_i60.PoliciesDataModel> selectedPolicies,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         SelectRequestTypeRoute.name,
         args: SelectRequestTypeRouteArgs(
           key: key,
           selectedPolicies: selectedPolicies,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectRequestTypeRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectRequestTypeRouteArgs>();
      return _i38.SelectRequestTypeScreen(
        key: args.key,
        selectedPolicies: args.selectedPolicies,
      );
    },
  );
}

class SelectRequestTypeRouteArgs {
  const SelectRequestTypeRouteArgs({this.key, required this.selectedPolicies});

  final _i51.Key? key;

  final List<_i60.PoliciesDataModel> selectedPolicies;

  @override
  String toString() {
    return 'SelectRequestTypeRouteArgs{key: $key, selectedPolicies: $selectedPolicies}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SelectRequestTypeRouteArgs) return false;
    return key == other.key &&
        const _i56.ListEquality<_i60.PoliciesDataModel>().equals(
          selectedPolicies,
          other.selectedPolicies,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i56.ListEquality<_i60.PoliciesDataModel>().hash(selectedPolicies);
}

/// generated route for
/// [_i39.SickLeaveAnalyticsScreen]
class SickLeaveAnalyticsRoute
    extends _i50.PageRouteInfo<SickLeaveAnalyticsRouteArgs> {
  SickLeaveAnalyticsRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         SickLeaveAnalyticsRoute.name,
         args: SickLeaveAnalyticsRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'SickLeaveAnalyticsRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SickLeaveAnalyticsRouteArgs>();
      return _i39.SickLeaveAnalyticsScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class SickLeaveAnalyticsRouteArgs {
  const SickLeaveAnalyticsRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i40.SickLeavePolicesScreen]
class SickLeavePolicesRoute extends _i50.PageRouteInfo<void> {
  const SickLeavePolicesRoute({List<_i50.PageRouteInfo>? children})
    : super(SickLeavePolicesRoute.name, initialChildren: children);

  static const String name = 'SickLeavePolicesRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i40.SickLeavePolicesScreen();
    },
  );
}

/// generated route for
/// [_i41.SickLeaveServiceScreen]
class SickLeaveServiceRoute
    extends _i50.PageRouteInfo<SickLeaveServiceRouteArgs> {
  SickLeaveServiceRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         SickLeaveServiceRoute.name,
         args: SickLeaveServiceRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'SickLeaveServiceRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SickLeaveServiceRouteArgs>();
      return _i41.SickLeaveServiceScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class SickLeaveServiceRouteArgs {
  const SickLeaveServiceRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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
/// [_i42.SplashScreen]
class SplashRoute extends _i50.PageRouteInfo<void> {
  const SplashRoute({List<_i50.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i42.SplashScreen();
    },
  );
}

/// generated route for
/// [_i43.TemplateUploadScreen]
class TemplateUploadRoute extends _i50.PageRouteInfo<void> {
  const TemplateUploadRoute({List<_i50.PageRouteInfo>? children})
    : super(TemplateUploadRoute.name, initialChildren: children);

  static const String name = 'TemplateUploadRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i43.TemplateUploadScreen();
    },
  );
}

/// generated route for
/// [_i44.TermsScreen]
class TermsRoute extends _i50.PageRouteInfo<void> {
  const TermsRoute({List<_i50.PageRouteInfo>? children})
    : super(TermsRoute.name, initialChildren: children);

  static const String name = 'TermsRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i44.TermsScreen();
    },
  );
}

/// generated route for
/// [_i45.UniqueServiceScreen]
class UniqueServiceRoute extends _i50.PageRouteInfo<void> {
  const UniqueServiceRoute({List<_i50.PageRouteInfo>? children})
    : super(UniqueServiceRoute.name, initialChildren: children);

  static const String name = 'UniqueServiceRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i45.UniqueServiceScreen();
    },
  );
}

/// generated route for
/// [_i46.UpdateExistingManagerScreen]
class UpdateExistingManagerRoute extends _i50.PageRouteInfo<void> {
  const UpdateExistingManagerRoute({List<_i50.PageRouteInfo>? children})
    : super(UpdateExistingManagerRoute.name, initialChildren: children);

  static const String name = 'UpdateExistingManagerRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i46.UpdateExistingManagerScreen();
    },
  );
}

/// generated route for
/// [_i47.UtilizationNotificationsScreen]
class UtilizationNotificationsRoute
    extends _i50.PageRouteInfo<UtilizationNotificationsRouteArgs> {
  UtilizationNotificationsRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         UtilizationNotificationsRoute.name,
         args: UtilizationNotificationsRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'UtilizationNotificationsRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UtilizationNotificationsRouteArgs>();
      return _i47.UtilizationNotificationsScreen(
        key: args.key,
        policyId: args.policyId,
      );
    },
  );
}

class UtilizationNotificationsRouteArgs {
  const UtilizationNotificationsRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

  final int policyId;

  @override
  String toString() {
    return 'UtilizationNotificationsRouteArgs{key: $key, policyId: $policyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UtilizationNotificationsRouteArgs) return false;
    return key == other.key && policyId == other.policyId;
  }

  @override
  int get hashCode => key.hashCode ^ policyId.hashCode;
}

/// generated route for
/// [_i48.UtilizationScreen]
class UtilizationRoute extends _i50.PageRouteInfo<UtilizationRouteArgs> {
  UtilizationRoute({
    _i51.Key? key,
    required int policyId,
    List<_i50.PageRouteInfo>? children,
  }) : super(
         UtilizationRoute.name,
         args: UtilizationRouteArgs(key: key, policyId: policyId),
         initialChildren: children,
       );

  static const String name = 'UtilizationRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UtilizationRouteArgs>();
      return _i48.UtilizationScreen(key: args.key, policyId: args.policyId);
    },
  );
}

class UtilizationRouteArgs {
  const UtilizationRouteArgs({this.key, required this.policyId});

  final _i51.Key? key;

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

/// generated route for
/// [_i49.ViewTrackRequestsScreen]
class ViewTrackRequestsRoute extends _i50.PageRouteInfo<void> {
  const ViewTrackRequestsRoute({List<_i50.PageRouteInfo>? children})
    : super(ViewTrackRequestsRoute.name, initialChildren: children);

  static const String name = 'ViewTrackRequestsRoute';

  static _i50.PageInfo page = _i50.PageInfo(
    name,
    builder: (data) {
      return const _i49.ViewTrackRequestsScreen();
    },
  );
}
