import 'dart:convert';

import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/dependencies/injectable_dependencies.dart';
import 'caching_keys.dart';

class CommonCaching {
  CommonCaching._();

  static final SharedPreferences _pref = sl<SharedPreferences>();

  static UserModel? get userModel => _pref.containsKey(CachingKeys.user)
      ? UserModel.fromJson(
          json.decode(_pref.getString(CachingKeys.user).toString()),
        )
      : null;

  static set userModel(UserModel? userModel) {
    if (userModel == null) return;
    _pref.setString(CachingKeys.defaultAddress, jsonEncode(userModel.toJson()));
  }
}
