import 'package:flutter/foundation.dart';

class AppConfig extends ChangeNotifier {
  String _baseUrl = 'https://prod.api.com';
  String get baseUrl => _baseUrl;

  void updateBaseUrl(String newUrl) {
    if (_baseUrl != newUrl) {
      _baseUrl = newUrl;
      notifyListeners(); // triggers provider rebuild
    }
  }
}
