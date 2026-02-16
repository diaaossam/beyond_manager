// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/bloc/global_cubit/global_cubit.dart' as _i913;
import '../../core/bloc/network/network_cubit.dart' as _i730;
import '../../core/services/api/app_interceptors.dart' as _i50;
import '../../core/services/api/dio_client.dart' as _i763;
import '../../core/services/api/dio_consumer.dart' as _i384;
import '../../core/services/location/global_location_service.dart' as _i815;
import '../../core/services/network/error/api_error_handler.dart' as _i665;
import '../../core/services/network/internet_checker/connectivity_helper.dart'
    as _i305;
import '../../core/services/network/internet_checker/netwok_info.dart'
    as _i1035;
import '../../features/addation_deletion/data/datasources/addation_deletion_remote_data_source.dart'
    as _i536;
import '../../features/addation_deletion/data/repositories/addation_deletion_repository.dart'
    as _i198;
import '../../features/addation_deletion/presentation/cubit/addation/addation.dart'
    as _i90;
import '../../features/addation_deletion/presentation/cubit/deletion/deletion_cubit.dart'
    as _i856;
import '../../features/addation_deletion/presentation/cubit/policies_data/policies_data_cubit.dart'
    as _i612;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i153;
import '../../features/auth/presentation/cubit/logout/logout_cubit.dart'
    as _i401;
import '../../features/auth/presentation/cubit/otp/otp_cubit.dart' as _i90;
import '../../features/auth/presentation/cubit/profile/profile_cubit.dart'
    as _i394;
import '../../features/auth/presentation/cubit/request_demo/request_demo_cubit.dart'
    as _i769;
import '../../features/car_service/data/datasources/car_service_remote_data_source.dart'
    as _i881;
import '../../features/car_service/data/repositories/car_service_repository_impl.dart'
    as _i136;
import '../../features/car_service/presentation/cubit/car_service_cubit.dart'
    as _i392;
import '../../features/emergency/data/datasources/emergency_remote_data_source.dart'
    as _i281;
import '../../features/emergency/data/repositories/emergency_repo_impl.dart'
    as _i1008;
import '../../features/emergency/presentation/cubit/create_emergency_cubit.dart'
    as _i1050;
import '../../features/emergency/presentation/cubit/emergency_cubit.dart'
    as _i1041;
import '../../features/hr_access/data/datasources/hr_access_remote_data_source.dart'
    as _i883;
import '../../features/hr_access/data/repositories/hr_access_repository.dart'
    as _i48;
import '../../features/hr_access/presentation/cubit/create_hr_access/create_hr_access_cubit.dart'
    as _i395;
import '../../features/hr_access/presentation/cubit/update_hr_access/update_hr_access_cubit.dart'
    as _i439;
import '../../features/network/data/datasources/network_remote_data_source.dart'
    as _i98;
import '../../features/network/data/repositories/network_repository.dart'
    as _i950;
import '../../features/network/presentation/bloc/search/search_cubit.dart'
    as _i504;
import '../../features/network/presentation/bloc/search_result/search_result_cubit.dart'
    as _i114;
import '../../features/other_line/data/datasources/other_line_remote_data_source.dart'
    as _i932;
import '../../features/other_line/data/repositories/other_line_repository_impl.dart'
    as _i214;
import '../../features/other_line/presentation/cubit/all_recomended/recommended_cubit.dart'
    as _i562;
import '../../features/other_line/presentation/cubit/insurance/insurance_cubit.dart'
    as _i323;
import '../../features/other_line/presentation/cubit/other_line_cubit.dart'
    as _i859;
import '../../features/policies/data/datasources/policies_remote_data_source.dart'
    as _i60;
import '../../features/policies/data/repositories/policies_repository_impl.dart'
    as _i998;
import '../../features/policies/presentation/cubit/active_policy/active_policy_bloc.dart'
    as _i333;
import '../../features/policies/presentation/cubit/policies_cubit.dart'
    as _i592;
import '../../features/policies/presentation/cubit/policy_access/policy_access_cubit.dart'
    as _i12;
import '../../features/policies/presentation/cubit/policy_details/policy_details_bloc.dart'
    as _i928;
import '../../features/policies/presentation/cubit/policy_payment/policy_payment_bloc.dart'
    as _i161;
import '../../features/policies/presentation/cubit/reimbursement/reimbursement_cubit.dart'
    as _i892;
import '../../features/policies/presentation/cubit/utilization/utilization_bloc.dart'
    as _i797;
import '../../features/policies/presentation/cubit/utilization/utilization_notification_cubit.dart'
    as _i190;
import '../../features/reservation/data/datasources/reservation_remote_data_source.dart'
    as _i86;
import '../../features/reservation/data/repositories/reservation_repository_impl.dart'
    as _i264;
import '../../features/reservation/presentation/cubit/booking/booking_cubit.dart'
    as _i268;
import '../../features/reservation/presentation/cubit/doctor_result/doctor_result_cubit.dart'
    as _i438;
import '../../features/reservation/presentation/cubit/new_reservation/new_reservation_cubit.dart'
    as _i574;
import '../../features/reservation/presentation/cubit/reservation/reservation_cubit.dart'
    as _i747;
import '../../features/settings/data/datasources/settings_remote_data_source.dart'
    as _i188;
import '../../features/settings/data/repositories/settings_repo_impl.dart'
    as _i91;
import '../../features/settings/presentation/cubit/settings_cubit.dart'
    as _i792;
import '../../features/settings/presentation/cubit/terms_cubit.dart' as _i562;
import '../../features/sick_leave/data/datasources/sick_leave_remote_data_source.dart'
    as _i190;
import '../../features/sick_leave/data/repositories/sick_leave_repo_impl.dart'
    as _i1072;
import '../../features/sick_leave/presentation/cubit/create_sick_leave/create_sick_leave_cubit.dart'
    as _i828;
import '../../features/sick_leave/presentation/cubit/feedback/feedback_cubit.dart'
    as _i92;
import '../../features/sick_leave/presentation/cubit/my_sick_leave/my_sick_leave_cubit.dart'
    as _i163;
import '../../features/sick_leave/presentation/cubit/sick_leave_active_list/sl_active_list_cubit.dart'
    as _i119;
import '../../features/sick_leave/presentation/cubit/sick_leave_analytics/sick_leave_analytics_cubit.dart'
    as _i191;
import '../../features/start/data/datasources/init_remote_data_source.dart'
    as _i95;
import '../../features/start/data/repositories/init_repo_impl.dart' as _i941;
import '../../features/start/presentation/cubit/start/start_cubit.dart' as _i33;
import '../helper/device_helper.dart' as _i620;
import '../helper/token_repository.dart' as _i734;
import 'external.dart' as _i379;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
    gh.factory<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.factory<_i892.FirebaseMessaging>(() => registerModule.firebaseMessaging);
    gh.factory<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i398.FirebaseAnalytics>(() => registerModule.firebaseAnalytics);
    gh.factory<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i730.NetworkCubit>(() => _i730.NetworkCubit());
    gh.factory<_i665.ApiErrorHandler>(() => _i665.ApiErrorHandler());
    gh.lazySingleton<_i815.GlobalLocationService>(
      () => _i815.GlobalLocationService(),
    );
    gh.factory<_i1035.NetworkInfo>(() => _i1035.NetworkInfoImpl());
    gh.factory<_i305.ConnectivityHelper>(
      () => _i305.ConnectivityHelper(connectivity: gh<_i895.Connectivity>()),
    );
    gh.factory<_i913.GlobalCubit>(
      () => _i913.GlobalCubit(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i620.DeviceHelper>(() => _i620.DeviceHelperImpl());
    gh.factory<_i734.TokenRepository>(
      () => _i734.TokenRepositoryImp(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i50.AppInterceptors>(
      () => _i50.AppInterceptors(gh<_i734.TokenRepository>()),
    );
    gh.lazySingleton<_i763.DioClient>(
      () => _i763.DioClient(
        client: gh<_i361.Dio>(),
        apiErrorHandler: gh<_i665.ApiErrorHandler>(),
        appInterceptors: gh<_i50.AppInterceptors>(),
      ),
    );
    gh.lazySingleton<_i384.DioConsumer>(
      () => _i384.DioConsumer(client: gh<_i763.DioClient>()),
    );
    gh.factory<_i932.OtherLineRemoteDataSource>(
      () => _i932.OtherLineRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.factory<_i98.NetworkRemoteDataSource>(
      () => _i98.NetworkRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.factory<_i950.NetworkRepositoryImpl>(
      () => _i950.NetworkRepositoryImpl(
        networkInfo: gh<_i1035.NetworkInfo>(),
        networkRemoteDataSource: gh<_i98.NetworkRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i883.HrAccessRemoteDataSource>(
      () => _i883.HrAccessRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i536.AddationDeletionRemoteDataSource>(
      () => _i536.AddationDeletionRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i48.HrAccessRepository>(
      () => _i48.HrAccessRepository(
        remoteDataSource: gh<_i883.HrAccessRemoteDataSource>(),
      ),
    );
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
        deviceHelper: gh<_i620.DeviceHelper>(),
        tokenRepository: gh<_i734.TokenRepository>(),
      ),
    );
    gh.factory<_i60.PoliciesRemoteDataSource>(
      () => _i60.PoliciesRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i881.CarServiceRemoteDataSource>(
      () => _i881.CarServiceRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i198.AddationDeletionRepository>(
      () => _i198.AddationDeletionRepository(
        remoteDataSource: gh<_i536.AddationDeletionRemoteDataSource>(),
      ),
    );
    gh.factory<_i90.AddationCubit>(
      () => _i90.AddationCubit(gh<_i198.AddationDeletionRepository>()),
    );
    gh.lazySingleton<_i86.ReservationRemoteDataSource>(
      () => _i86.ReservationRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i214.OtherLineRepositoryImpl>(
      () => _i214.OtherLineRepositoryImpl(
        otherLineRemoteDataSource: gh<_i932.OtherLineRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i136.CarServiceRepositoryImpl>(
      () => _i136.CarServiceRepositoryImpl(
        remoteDataSource: gh<_i881.CarServiceRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i662.AuthRepository>(
      () => _i662.AuthRepository(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i188.SettingsRemoteDataSource>(
      () => _i188.SettingsRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.factory<_i856.DeletionCubit>(
      () => _i856.DeletionCubit(gh<_i198.AddationDeletionRepository>()),
    );
    gh.factory<_i95.InitRemoteDataSource>(
      () => _i95.RegisterRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
        tokenRepository: gh<_i734.TokenRepository>(),
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i504.SearchCubit>(
      () => _i504.SearchCubit(gh<_i950.NetworkRepositoryImpl>()),
    );
    gh.factory<_i114.SearchResultCubit>(
      () => _i114.SearchResultCubit(gh<_i950.NetworkRepositoryImpl>()),
    );
    gh.lazySingleton<_i998.PoliciesRepositoryImpl>(
      () => _i998.PoliciesRepositoryImpl(
        policiesRemoteDataSource: gh<_i60.PoliciesRemoteDataSource>(),
      ),
    );
    gh.factory<_i190.SickLeaveRemoteDataSource>(
      () => _i190.SickLeaveRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i941.InitRepo>(
      () =>
          _i941.InitRepo(initRemoteDataSource: gh<_i95.InitRemoteDataSource>()),
    );
    gh.factory<_i281.EmergencyRemoteDataSource>(
      () => _i281.EmergencyRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.factory<_i333.ActivePolicyCubit>(
      () => _i333.ActivePolicyCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i592.PoliciesCubit>(
      () => _i592.PoliciesCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i12.PolicyAccessCubit>(
      () => _i12.PolicyAccessCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i928.PolicyDetailsCubit>(
      () => _i928.PolicyDetailsCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i161.PolicyPaymentCubit>(
      () => _i161.PolicyPaymentCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i892.ReimbursementCubit>(
      () => _i892.ReimbursementCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.factory<_i797.UtilizationCubit>(
      () => _i797.UtilizationCubit(gh<_i998.PoliciesRepositoryImpl>()),
    );
    gh.lazySingleton<_i91.SettingsRepositoryImpl>(
      () => _i91.SettingsRepositoryImpl(
        settingsRemoteDataSource: gh<_i188.SettingsRemoteDataSource>(),
      ),
    );
    gh.factory<_i392.CarServiceCubit>(
      () => _i392.CarServiceCubit(gh<_i136.CarServiceRepositoryImpl>()),
    );
    gh.factory<_i395.CreateHrAccessCubit>(
      () => _i395.CreateHrAccessCubit(
        gh<_i48.HrAccessRepository>(),
        gh<_i998.PoliciesRepositoryImpl>(),
      ),
    );
    gh.factory<_i439.UpdateHrAccessCubit>(
      () => _i439.UpdateHrAccessCubit(
        gh<_i48.HrAccessRepository>(),
        gh<_i998.PoliciesRepositoryImpl>(),
      ),
    );
    gh.factory<_i612.PoliciesDataCubit>(
      () => _i612.PoliciesDataCubit(gh<_i198.AddationDeletionRepository>()),
    );
    gh.lazySingleton<_i264.ReservationRepositoryImpl>(
      () => _i264.ReservationRepositoryImpl(
        remoteDataSource: gh<_i86.ReservationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1008.EmergencyRepositoryImpl>(
      () => _i1008.EmergencyRepositoryImpl(
        emergencyRemoteDataSource: gh<_i281.EmergencyRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1072.SickLeaveRepositoryImpl>(
      () => _i1072.SickLeaveRepositoryImpl(
        sickLeaveRemoteDataSource: gh<_i190.SickLeaveRemoteDataSource>(),
      ),
    );
    gh.factory<_i828.CreateSickLeaveCubit>(
      () => _i828.CreateSickLeaveCubit(gh<_i1072.SickLeaveRepositoryImpl>()),
    );
    gh.factory<_i92.FeedbackCubit>(
      () => _i92.FeedbackCubit(gh<_i1072.SickLeaveRepositoryImpl>()),
    );
    gh.factory<_i163.MySickLeaveCubit>(
      () => _i163.MySickLeaveCubit(gh<_i1072.SickLeaveRepositoryImpl>()),
    );
    gh.factory<_i119.SlActiveListCubit>(
      () => _i119.SlActiveListCubit(gh<_i1072.SickLeaveRepositoryImpl>()),
    );
    gh.factory<_i191.SickLeaveAnalyticsCubit>(
      () => _i191.SickLeaveAnalyticsCubit(gh<_i1072.SickLeaveRepositoryImpl>()),
    );
    gh.factory<_i394.ProfileCubit>(
      () => _i394.ProfileCubit(gh<_i662.AuthRepository>()),
    );
    gh.factory<_i769.RequestDemoCubit>(
      () => _i769.RequestDemoCubit(gh<_i662.AuthRepository>()),
    );
    gh.factory<_i268.BookingCubit>(
      () => _i268.BookingCubit(gh<_i264.ReservationRepositoryImpl>()),
    );
    gh.factory<_i438.DoctorResultCubit>(
      () => _i438.DoctorResultCubit(gh<_i264.ReservationRepositoryImpl>()),
    );
    gh.factory<_i574.NewReservationCubit>(
      () => _i574.NewReservationCubit(gh<_i264.ReservationRepositoryImpl>()),
    );
    gh.factory<_i747.ReservationCubit>(
      () => _i747.ReservationCubit(gh<_i264.ReservationRepositoryImpl>()),
    );
    gh.factory<_i190.UtilizationNotificationCubit>(
      () => _i190.UtilizationNotificationCubit(
        gh<_i998.PoliciesRepositoryImpl>(),
      ),
    );
    gh.factory<_i153.LoginCubit>(
      () => _i153.LoginCubit(gh<_i662.AuthRepository>()),
    );
    gh.factory<_i401.LogoutCubit>(
      () => _i401.LogoutCubit(gh<_i662.AuthRepository>()),
    );
    gh.factory<_i90.OtpCubit>(() => _i90.OtpCubit(gh<_i662.AuthRepository>()));
    gh.factory<_i562.RecommendedCubit>(
      () => _i562.RecommendedCubit(gh<_i214.OtherLineRepositoryImpl>()),
    );
    gh.factory<_i323.InsuranceCubit>(
      () => _i323.InsuranceCubit(gh<_i214.OtherLineRepositoryImpl>()),
    );
    gh.factory<_i859.OtherLineCubit>(
      () => _i859.OtherLineCubit(gh<_i214.OtherLineRepositoryImpl>()),
    );
    gh.factory<_i33.StartCubit>(() => _i33.StartCubit(gh<_i941.InitRepo>()));
    gh.factory<_i792.SettingsCubit>(
      () => _i792.SettingsCubit(gh<_i91.SettingsRepositoryImpl>()),
    );
    gh.factory<_i562.TermsCubit>(
      () => _i562.TermsCubit(gh<_i91.SettingsRepositoryImpl>()),
    );
    gh.factory<_i1050.CreateEmergencyCubit>(
      () => _i1050.CreateEmergencyCubit(gh<_i1008.EmergencyRepositoryImpl>()),
    );
    gh.factory<_i1041.EmergencyCubit>(
      () => _i1041.EmergencyCubit(gh<_i1008.EmergencyRepositoryImpl>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i379.RegisterModule {}
