import 'package:movie/core/errors/app_exceptions.dart';
import 'package:movie/core/recources/costants_manager.dart';
import 'package:movie/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getId() async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheConstants.idKey)!;
    } catch (exception) {
      throw LocalException(message: "Failed to get id");
    }
  }

  @override
  Future<void> saveId(String id) async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString(CacheConstants.idKey, id);
    } catch (exception) {
      throw LocalException(message: "Failed to save id");
    }
  }
}
