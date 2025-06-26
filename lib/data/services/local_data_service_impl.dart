import 'package:shared_preferences/shared_preferences.dart';
import 'local_data_service.dart';

class LocalDataServiceImpl implements LocalDataService {
  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<void> saveData(String key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, value);
  }

  @override
  Future<String?> loadData(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key);
  }

  @override
  Future<void> deleteData(String key) async {
    final prefs = await _getPrefs();
    await prefs.remove(key);
  }

  @override
  Future<void> clearAllData() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(key, value);
  }

  @override
  Future<bool?> loadBool(String key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    final prefs = await _getPrefs();
    await prefs.setInt(key, value);
  }

  @override
  Future<int?> loadInt(String key) async {
    final prefs = await _getPrefs();
    return prefs.getInt(key);
  }

  // Example for saving/loading complex objects (requires jsonEncode/jsonDecode)
  // @override
  // Future<void> saveObject(String key, Map<String, dynamic> jsonObject) async {
  //   final String jsonString = jsonEncode(jsonObject);
  //   await saveData(key, jsonString);
  // }

  // @override
  // Future<Map<String, dynamic>?> loadObject(String key) async {
  //   final String? jsonString = await loadData(key);
  //   if (jsonString != null) {
  //     return jsonDecode(jsonString) as Map<String, dynamic>;
  //   }
  //   return null;
  // }
}
