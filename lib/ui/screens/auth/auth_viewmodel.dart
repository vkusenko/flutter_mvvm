import 'package:flutter/foundation.dart';

import '../../../data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  AuthRepository _authRepository;

  AuthViewModel(this._authRepository) {
    print('myTest 200');
  }

  bool _isLoggedIn = true;
  bool get isLoggedIn => _isLoggedIn;

  String? error;

  void updateRepository(AuthRepository newRepository) {
    _authRepository = newRepository;
    notifyListeners(); // Important for GoRouter refresh
  }

  Future<void> login(String username, String password) async {
    error = null;
    final success = await _authRepository.login(username, password);
    _isLoggedIn = success;
    if (!success) error = 'Invalid credentials';
    notifyListeners();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
      _isLoggedIn = await _authRepository.isLoggedIn();
      notifyListeners();
  }
}