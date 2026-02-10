import 'dart:math';

import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/services/network/error/exceptions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/helper/device_helper.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../generated/l10n.dart';
import '../models/request/login_params.dart';
import '../models/request/otp_params.dart';
import '../models/request/request_demo_params.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> verifyOtp({required OtpParams params});

  Future<String> sendOtp({required String phone, required bool isWhatsApp});

  Future<UserModel> getUserData();

  Future<UserModel> loginUser({required LoginParams loginParams});

  Future<String> requestDemo({required RequestDemoParams params});

  Future<Unit> logout();

  Future<Unit> updateFcm();

  Future<Unit> updateCompany({required num id});
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final TokenRepository tokenRepository;
  final DeviceHelper deviceHelper;

  AuthRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.sharedPreferences,
    required this.deviceHelper,
    required this.tokenRepository,
  });

  @override
  Future<Unit> verifyOtp({required OtpParams params}) async {
    if (params.userOtpCode != params.publicOtpCode &&
        params.userOtpCode != params.otpCode) {
      throw ServerException(errors: S.current.invalidOtp);
    }

    CommonCaching.userModel = UserDataService().getUserData();
    sharedPreferences.setString(
      AppStrings.userPhone,
      UserDataService().getUserData()?.phone ?? "",
    );
    sharedPreferences.setInt(
      AppStrings.userId,
      UserDataService().getUserData()?.id?[0].id ?? 0,
    );
    updateFcm();
    await ApiConfig().init();
    return unit;
  }

  @override
  Future<UserModel> getUserData() async {
    return await dioConsumer.get(EndPoints.profile).factory((json) {
      return UserModel.fromJson(json['result'][0]);
    }).execute();
  }

  @override
  Future<Unit> logout() async {
    await sharedPreferences.clear();
    await tokenRepository.deleteToken();
    await ApiConfig().init();
    return unit;
  }

  @override
  Future<UserModel> loginUser({required LoginParams loginParams}) async {
    final data = await dioConsumer
        .get<UserModel>(EndPoints.login)
        .params(loginParams.toJson())
        .factory((json) => UserModel.fromJson(json['result'][0]))
        .execute();
    UserDataService().setUserData(data);
    return data;
  }

  @override
  Future<String> requestDemo({required RequestDemoParams params}) async {
    RequestDemoParams data = params.copyWith(
      token: await deviceHelper.deviceToken,
    );
    return await dioConsumer
        .post(EndPoints.requestDemo)
        .params(data.toJson())
        .factory((json) => json['result']['message'])
        .execute();
  }

  @override
  Future<String> sendOtp({
    required String phone,
    required bool isWhatsApp,
  }) async {
    var code = Random().nextInt(900000) + 100000;

/*
    if (isWhatsApp) {
      await dioConsumer
          .post(EndPoints.sendWhatsApp)
          .params({
            "phone": "+2$phone",
            "message":
                "Your Beyond Manager OTP code is: $code. Valid for 5 minutes.",
            "customer_name": UserDataService().getUserData()?.name,
          })
          .factory((json) => "$code")
          .execute();
    }
    else {
      await dioConsumer
          .post(EndPoints.sendOtp)
          .query({
            "mobile": phone,
            "message":
                "Your Beyond Manager OTP code is: $code. Valid for 5 minutes.",
          })
          .factory((json) => "$code")
          .execute();
    }
*/

    return code.toString();
  }

  @override
  Future<Unit> updateFcm() async {
    final String token = await deviceHelper.deviceToken;
    await dioConsumer
        .put(EndPoints.updateProfileData)
        .params({
          "mobile": UserDataService().getUserData()?.phone,
          "token": token,
        })
        .factory((json) => '')
        .execute();

    return unit;
  }

  @override
  Future<Unit> updateCompany({required num id}) async {
    await dioConsumer
        .put(EndPoints.updateProfileData)
        .params({
          "mobile": UserDataService().getUserData()?.phone,
          "current_company_id": id,
        })
        .factory((json) => '')
        .execute();

    return unit;
  }
}
