import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'auth_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                auth.login(
                  _userController.text,
                  _passController.text,
                );
              },
              child: Text('Login'),
            ),
            if (auth.error != null) ...[
              SizedBox(height: 10),
              Text(auth.error!, style: TextStyle(color: Colors.red)),
            ]
          ],
        ),
      ),
    );
  }
}