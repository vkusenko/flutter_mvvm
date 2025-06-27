abstract class LocalDataService {
  Future<void> saveData(String key, String value);
  Future<String?> loadData(String key);
  Future<void> deleteData(String key);
  Future<void> clearAllData(); // Optional: for clearing all stored data

  // Example for typed data
  Future<void> saveBool(String key, bool value);
  Future<bool?> loadBool(String key);

  Future<void> saveInt(String key, int value);
  Future<int?> loadInt(String key);

  // Potentially methods for storing/retrieving complex objects (e.g., after JSON serialization)
  Future<void> saveObject(String key, Map<String, dynamic> jsonObject);
  Future<Map<String, dynamic>?> loadObject(String key);
}
