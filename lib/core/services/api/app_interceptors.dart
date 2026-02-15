import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/features/settings/settings_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:bond/config/environment/environment_helper.dart' as env;

import '../../../config/helper/context_helper.dart';
import '../../../features/auth/data/models/response/user_model_helper.dart';
import '../../utils/api_config.dart';

@injectable
class AppInterceptors extends Interceptor {
  final TokenRepository _tokenDataSource;

  AppInterceptors(this._tokenDataSource);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      SettingsHelper().showAuthDialog();
      return;
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters["language"] = "eng";
    options.queryParameters["client_key"] = env.Environment.clientKey;
    options.queryParameters["client_secret"] = env.Environment.clientSecret;
    options.queryParameters["client_secret"] = env.Environment.clientSecret;
    if (ApiConfig.userId != -1) {
      options.queryParameters["user_manager_id"] = ApiConfig.userId;
      options.queryParameters["company_id"] =
          UserDataService().getUserData()?.currentCompanyId ??
          CommonCaching.userModel?.currentCompanyId;
    }
    return handler.next(options);
  }
}
