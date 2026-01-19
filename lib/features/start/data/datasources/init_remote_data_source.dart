import 'package:auto_route/auto_route.dart';
import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/helper/token_helper.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../auth/data/models/response/user_model_helper.dart';

abstract class InitRemoteDataSource {
  Future<PageRouteInfo> initUser();
}

@Injectable(as: InitRemoteDataSource)
class RegisterRemoteDataSourceImpl implements InitRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final TokenRepository tokenRepository;
  final AuthRemoteDataSource authRemoteDataSource;

  RegisterRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.sharedPreferences,
    required this.tokenRepository,
    required this.authRemoteDataSource,
  });

  @override
  Future<PageRouteInfo> initUser() async {
    final userId = sharedPreferences.getInt(AppStrings.userId);
    if (userId == null) {
      return LoginRoute();
    } else {
      final response = await authRemoteDataSource.getUserData();

      UserDataService().setUserData(response);
      return MainLayoutRoute();
    }
  }
}
