abstract final class Routes {
  static const home = '/home';
  static const test = '/test';
  static const test2 = '/test2';
  static const test3 = '/test3';
  static const login = '/login';
}

abstract final class AuthRoutes {
  static const auth = '/auth';
  static const authPhoneNumber = '/auth/phone_number';
  static const authDOB = '/auth/dob';
  static const authOTP = '/auth/otp';
  static const authPolicy = '/auth/policy';
  static const authSetupPIN = '/auth/setup_pin';
}

abstract final class MainRoutes {
  static const main = '/';
  static const chat = '/chat';
  static const rpm = '/rpm';
}