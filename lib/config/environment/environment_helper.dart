import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => ".env.production";

  static String get apiUrl => dotenv.env['API_BASE_URL'] ?? 'MY_FALLBACK';

  static String get clientKey => dotenv.env['API_CLIENT_KEY'] ?? 'MY_FALLBACK';

  static String get clientSecret =>
      dotenv.env['API_CLIENT_SECRET'] ?? 'MY_FALLBACK';
}
