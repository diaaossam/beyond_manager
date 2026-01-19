import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/auth/data/models/request/request_demo_params.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/request/login_params.dart';
import '../models/request/otp_params.dart';

@LazySingleton()
class AuthRepository with ApiHandlerMixin {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository({required this.authRemoteDataSource});

  Future<Either<Failure, String>> sendOtp({
    required String phone,
    required bool isWhatsApp,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.sendOtp(phone: phone, isWhatsApp: isWhatsApp),
    );
    return response;
  }

  Future<Either<Failure, Unit>> verifyOtp({required OtpParams params}) async {
    final response = await handleApi(
      () => authRemoteDataSource.verifyOtp(params: params),
    );
    return response;
  }

  Future<Either<Failure, Unit>> updateFcm() async {
    final response = await handleApi(() => authRemoteDataSource.updateFcm());
    return response;
  }

  Future<Either<Failure, UserModel>> getUserData() async {
    final response = await handleApi(() => authRemoteDataSource.getUserData());
    return response;
  }

  Future<Either<Failure, Unit>> logOut() async {
    final response = await handleApi(() => authRemoteDataSource.logout());
    return response;
  }

  Future<Either<Failure, UserModel>> loginUser({
    required LoginParams loginParams,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.loginUser(loginParams: loginParams),
    );
    return response;
  }

  Future<Either<Failure, String>> requestDemo({
    required RequestDemoParams params,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.requestDemo(params: params),
    );
    return response;
  }

  Future<Either<Failure, Unit>> updateCompany({required num id}) async {
    final response = await handleApi(
      () => authRemoteDataSource.updateCompany(id: id),
    );
    return response;
  }
}
