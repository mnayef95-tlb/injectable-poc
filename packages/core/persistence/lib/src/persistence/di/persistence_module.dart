import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PersistenceModule {
  @preResolve
  Future<SharedPreferences> injectSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
