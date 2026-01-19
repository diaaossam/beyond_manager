import 'package:bond/features/auth/data/models/response/user_model.dart';

class LoginData {
  final UserModel? userModel;
  final String? errorMessage;
  final String? phoneNumber;

  LoginData({this.userModel, this.errorMessage, this.phoneNumber});

  LoginData copyWith({
    UserModel? userModel,
    String? errorMessage,
    String? phoneNumber,
  }) {
    return LoginData(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
