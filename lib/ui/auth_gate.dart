import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermvvm/ui/screens/auth/auth_viewmodel.dart';
import 'package:fluttermvvm/ui/screens/auth/login_screen.dart';
import 'package:fluttermvvm/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context
        .watch<AuthViewModel>()
        .isLoggedIn;
    print('myTest 300 isLoggedIn = $isLoggedIn');
    return isLoggedIn ? TestScreen() : LoginScreen();
  }

  @override
  void initState() {
    super.initState();

  }
}


/*class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
   *//* final isLoggedIn = context
        .watch<AuthViewModel>()
        .isLoggedIn;
    print('myTest 1 $isLoggedIn');
    if (!isLoggedIn) {
      print('myTest 2 ');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false);
    }*//*

    return TestScreen();
  }
}*/
