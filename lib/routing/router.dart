import 'package:fluttermvvm/routing/routes.dart';
import 'package:fluttermvvm/ui/screens/auth/auth_viewmodel.dart';
import 'package:fluttermvvm/ui/screens/auth/login_screen.dart';
import 'package:fluttermvvm/ui/screens/auth/phone_number/phone_number_screen.dart';
import 'package:fluttermvvm/ui/screens/auth/dob/dob_screen.dart';
import 'package:fluttermvvm/ui/screens/auth/otp/otp_screen.dart';
import 'package:fluttermvvm/ui/screens/auth/policy/policy_screen.dart';
import 'package:fluttermvvm/ui/screens/auth/setup_pin/setup_pin_screen.dart';
import 'package:fluttermvvm/ui/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router(AuthViewModel authViewModel) => GoRouter(
    initialLocation: Routes.test,
    debugLogDiagnostics: true,
    refreshListenable: authViewModel,
    redirect: (context, state) {
      final isLoggedIn = authViewModel.isLoggedIn;
      final isGoingToLogin = state.matchedLocation == Routes.login;

      // If logged in and trying to access login, redirect to home
      if (isLoggedIn && isGoingToLogin) {
        return Routes.test;
      }
      // If not logged in and not going to login, redirect to login
      if (!isLoggedIn && !isGoingToLogin) {
        return Routes.login;
      }
      return null; // No redirect needed
    },
    routes: [
      GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginScreen();
          }
      ),
      GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return HomeScreen();
          }
      ),
      GoRoute(
          path: Routes.test,
        builder: (context, state) {
            return TestScreen();
        }
      ),
      GoRoute(
          path: Routes.test2,
          builder: (context, state) {
            return TestScreen2();
          }
      ),
      GoRoute(
          path: Routes.test3,
          builder: (context, state) {
            return TestScreen3();
          }
      ),
      GoRoute(
        path: AuthRoutes.auth,
        redirect: (_, __) => AuthRoutes.authPhoneNumber,
      ),
      GoRoute(
        path: AuthRoutes.authPhoneNumber,
        builder: (context, state) => const PhoneNumberScreen(),
      ),
      GoRoute(
        path: AuthRoutes.authDOB,
        builder: (context, state) => const DobScreen(),
      ),
      GoRoute(
        path: AuthRoutes.authOTP,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: AuthRoutes.authPolicy,
        builder: (context, state) => const PolicyScreen(),
      ),
      GoRoute(
        path: AuthRoutes.authSetupPIN,
        builder: (context, state) => const SetupPinScreen(),
      ),
    ]
);