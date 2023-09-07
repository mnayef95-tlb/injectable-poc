import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LocalPersistenceDataSource {
  final SharedPreferences _sharedPreferences;

  const LocalPersistenceDataSource({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  String? getAuthToken() {
    return _sharedPreferences.getString("auth_token");
  }
}
