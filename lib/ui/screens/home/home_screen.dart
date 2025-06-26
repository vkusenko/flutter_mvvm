// ui/home_screen.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttermvvm/data/repositories/auth_repository.dart';
import 'package:fluttermvvm/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../app_config.dart';
import '../../../main.dart';
import '../auth/auth_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Screen!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TestScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the TestScreen Screen!'),
            Text('AppConfig.baseUrl = ${context.watch<AppConfig>().baseUrl}'),
            Text('ApiService.baseUrl = ${context.watch<ApiService>().baseUrl}'),
            Text('isLoggedIn = ${context.watch<AuthViewModel>().isLoggedIn}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.test2);
                /*Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return TestScreen2();
                    }));*/
              },
              child: Text('Go to TestScreen2'),
            ),
            ElevatedButton(
              onPressed: () {
                // AppRoot.of(context)?.updateEnv();
                context.read<AppConfig>().updateBaseUrl("baseUrl ${Random().nextInt(1000)}");
              },
              child: Text('updateBaseUrl'),
            ),
            ElevatedButton(
              onPressed: () {
                // AppRoot.of(context)?.updateEnv();
                context.read<AuthViewModel>().login("username", "password");
                context.read<AuthRepository>().login("username", "password");
              },
              child: Text('test authViewModel'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<AppConfig>();
    return Scaffold(
      appBar: AppBar(title: Text('TestScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the TestScreen Screen 2!'),
            Text('isLoggedIn = ${context.watch<AuthViewModel>().isLoggedIn}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push(Routes.test3);
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return TestScreen3();
                    }));*/
              },
              child: Text('Go to TestScreen3'),
            ),
            ElevatedButton(
              onPressed: () {
                // AppRoot.of(context)?.updateEnv();
                config.updateBaseUrl("baseUrl 1");
              },
              child: Text('updateBaseUrl'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen3 extends StatefulWidget {
  const TestScreen3({super.key});

  @override
  State<TestScreen3> createState() => _TestScreen3State();
}

class _TestScreen3State extends State<TestScreen3> {

  @override
  Widget build(BuildContext context) {
    final config = context.watch<AppConfig>();
    return Scaffold(
      appBar: AppBar(title: Text('TestScreen 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the TestScreen Screen 3!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return HomeScreen();
                    }));
              },
              child: Text('Go to Home'),
            ),
            ElevatedButton(
              onPressed: () {
                // AppRoot.of(context)?.updateEnv();
                config.updateBaseUrl("baseUrl 1");
              },
              child: Text('test'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('myTest 300');
    super.dispose();
  }
}

