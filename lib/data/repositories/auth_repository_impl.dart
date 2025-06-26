import 'package:fluttermvvm/main.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  bool _loggedIn = true;
  final ApiService apiService;

  AuthRepositoryImpl({required this.apiService});

  @override
  Future<bool> login(String username, String password) async {
    print("myTest apiService.baseUrl = ${apiService.baseUrl}");
    await Future.delayed(Duration(seconds: 1)); // Simulate network
    _loggedIn = username == 'admin' && password == '1234';
    return true;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
    _loggedIn = false;
  }

  @override
  Future<bool> isLoggedIn() async {
    await Future.delayed(Duration(milliseconds: 2000));

    return _loggedIn;
  }
}