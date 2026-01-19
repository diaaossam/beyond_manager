import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../enum/language.dart';
import 'app_strings.dart';

class ApiConfig {
  static late Language? language;
  static late bool? isGuest;
  static late ThemeMode? themeMode;
  static late String appVersion;
  static late String userPhone;
  static late int userId;

  Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    isGuest = sharedPreferences.getBool(AppStrings.isGuest) ?? false;
    String mode =
        sharedPreferences.getString(AppStrings.theme) ?? AppStrings.light;
    String stringLanguage =
        sharedPreferences.getString(AppStrings.locale) ?? AppStrings.arabicCode;
    userPhone =
        sharedPreferences.getString(AppStrings.userPhone) ??
        AppStrings.arabicCode;
    userId = sharedPreferences.getInt(AppStrings.userId) ?? -1;
    language = handleLanguageByString(code: stringLanguage);
    themeMode = mode == AppStrings.light ? ThemeMode.light : ThemeMode.dark;
    appVersion = packageInfo.version;
  }
}
