import 'package:learn_smart/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  bool getIsLoggedIn() {
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }
}
