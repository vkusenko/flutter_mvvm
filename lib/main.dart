import 'package:flutter/material.dart';
import 'package:fluttermvvm/routing/router.dart';
import 'package:fluttermvvm/ui/auth_gate.dart';
import 'package:fluttermvvm/ui/screens/auth/auth_viewmodel.dart';
import 'package:fluttermvvm/ui/screens/auth/login_screen.dart';
import 'package:fluttermvvm/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'app_config.dart';
import 'di/di_providers.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  static _AppRootState? of(BuildContext context) => context.findAncestorStateOfType<_AppRootState>();
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
/*  final _config = AppConfig();
  Key _providerKey = UniqueKey();*/

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final config = context.read<AppConfig>();
    });
  /*  _config.addListener(() {
      print('myTest 10');
      setState(() => _providerKey = UniqueKey());
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // key: _providerKey, // <- forces recreation of providers
      providers: [
        // ChangeNotifierProvider<AppConfig>.value(value: _config),
        ...diProviders,
      ],
      child: MyApp(),
    );
  }

  /*updateEnv() {
    print('myTest 11');
    setState(() => _providerKey = UniqueKey());
  }*/
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return MaterialApp.router(
      routerConfig: router(authViewModel),
    );
    /*return MaterialApp(
      home: AuthGate(),
    );*/
  }
}

// Removed ApiService from here, it's now in lib/data/services/

class ApiService2 {
  final String baseUrl;

  ApiService2(this.baseUrl);

  void fetchData() {
    print('Fetching from $baseUrl');
    // pretend API call
  }
}

