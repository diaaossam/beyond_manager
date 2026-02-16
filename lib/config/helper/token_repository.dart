import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenRepository {
  Future<void> saveToken(String token);

  Future<void> deleteToken();

  Future<String?> getToken();

  Future<bool> hastToken();
}

@Injectable(as: TokenRepository)
class TokenRepositoryImp implements TokenRepository {
  final SharedPreferences sharedPreferences;

  final String tokenKey = 'token';

  TokenRepositoryImp({required this.sharedPreferences});

  @override
  Future<void> deleteToken() async {
    if(sharedPreferences.containsKey(tokenKey)){
      await sharedPreferences.remove(tokenKey);
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(tokenKey);
  }

  @override
  Future<bool> hastToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
