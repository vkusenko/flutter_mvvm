import 'package:provider/provider.dart';

import '../app_config.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../main.dart';
import '../ui/screens/auth/auth_viewmodel.dart';

final diProviders = [
  ChangeNotifierProvider(create: (_) => AppConfig()),
  ProxyProvider<AppConfig, ApiService>(
    update: (_, config, __) => ApiService(config.baseUrl),
  ),
  ProxyProvider<ApiService, AuthRepository>(
      update: (_, service, __) => AuthRepositoryImpl(apiService: service),
  ),
  ChangeNotifierProxyProvider<AuthRepository, AuthViewModel>(
    create: (context) => AuthViewModel(context.read()),
    update: (_, repo, vm) => vm!..updateRepository(repo),
  ),
 /* ChangeNotifierProxyProvider<AuthRepository, AuthViewModel>(
    create: (context) => AuthViewModel(context.read()),
    update: (_, repo, __) => AuthViewModel(repo),
  ),*/
 /* ProxyProvider<AuthRepository, AuthViewModel>(
    update: (_, repo, __) => AuthViewModel(repo),
  ),*/
/*Provider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(apiService: context.read<ApiService>())
  ),*/
 /* Provider<AuthViewModel>(
    create: (context) => AuthViewModel(context.read<AuthRepository>()),
  ),*/
  /*Provider<ApiService>(
    create: (context) {
      final config = context.read<AppConfig>();
      return ApiService(config.baseUrl);
    },
  ),*/
  Provider<ApiService2>(
    create: (context) {
      final config = context.read<AppConfig>();
      return ApiService2(config.baseUrl);
    },
  )
];