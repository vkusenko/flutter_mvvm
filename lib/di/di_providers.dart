import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart'; // Required for List<SingleChildWidget>

import '../app_config.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/services/api_service.dart';
import '../data/services/api_service_impl.dart';
import '../data/services/local_data_service.dart';
import '../data/services/local_data_service_impl.dart';
import '../main.dart'; // Still needed for ApiService2 if we keep it
import '../ui/screens/auth/auth_viewmodel.dart';

final List<SingleChildWidget> diProviders = [
  ChangeNotifierProvider(create: (_) => AppConfig()),
  // API Service
  ProxyProvider<AppConfig, ApiService>(
    update: (_, config, __) => ApiServiceImpl(config.baseUrl),
  ),
  // Local Data Service
  Provider<LocalDataService>(
    create: (_) => LocalDataServiceImpl(),
  ),
  // Repositories
  ProxyProvider<ApiService, AuthRepository>(
    update: (_, apiService, __) => AuthRepositoryImpl(apiService: apiService),
    // If AuthRepositoryImpl needs LocalDataService:
    // update: (context, apiService, __) => AuthRepositoryImpl(
    //   apiService: apiService,
    //   localDataService: context.read<LocalDataService>(),
    // ),
  ),
  // ViewModels
  ChangeNotifierProxyProvider<AuthRepository, AuthViewModel>(
    create: (context) => AuthViewModel(context.read<AuthRepository>()),
    update: (_, repo, vm) => vm!..updateRepository(repo),
  ),
  // Keep ApiService2 if it's still used elsewhere, otherwise remove it.
  Provider<ApiService2>(
    create: (context) {
      final config = context.read<AppConfig>();
      return ApiService2(config.baseUrl);
    },
  )
];