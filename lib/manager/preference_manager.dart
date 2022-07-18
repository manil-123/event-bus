import 'package:shared_preferences/shared_preferences.dart';

class AppPreferenceManager {
  static final AppPreferenceManager _instance = AppPreferenceManager._init();
  static late SharedPreferences _pref;
  static late Map<String, dynamic> _prefMap;

  factory AppPreferenceManager() => _instance;

  AppPreferenceManager._init();

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    _prefMap = {};
  }

  String getString(String key) {
    String value = '';
    if (_prefMap.containsKey(key)) {
      value = _prefMap[key] as String? ?? "";
    } else {
      value = _pref.getString(key) ?? "";
    }
    return value;
  }

  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  void putString(String key, String value) {
    _prefMap[key] = value;
    _pref.setString(key, value);
  }

  void putBool(String key, {bool value = false}) {
    _pref.setBool(key, value);
  }

  void remove(String key) {
    _prefMap.remove(key);
    _pref.remove(key);
  }
}
