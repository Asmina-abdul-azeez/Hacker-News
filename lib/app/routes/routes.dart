// ignore_for_file: public_member_api_docs

class Routes {

  Routes._();
  static AuthRoutes authRoutes = AuthRoutes._();
  static AppRoutes appRoutes = AppRoutes._();
  static SplashRoutes splashRoutes = SplashRoutes._();
}

abstract class AppRouteBase {
  late String parentRoute;
}

class AuthRoutes implements AppRouteBase {
  AuthRoutes._();

  ///Auth screens
  String loginScreen = 'login';
  final signupScreen = 'signup';
  final forgotPasswordScreen = 'forgot-password';
  final verifyOtpScreen = 'verify-otp';

  ///route paths
  String get loginRoute => '$parentRoute/login';

  String get signupRoute => '$parentRoute/signup';

  String get forgotPasswordRoute => '$parentRoute/forgot-password';

  String get verifyOtpRoute => '$parentRoute/verify-otp';

  @override
  String parentRoute = '/auth';
}

class AppRoutes implements AppRouteBase {
  AppRoutes._();

  /// App screens*
  String get appHome => 'app-home';

  String get profile => 'profile';

  ///route paths
  String get appHomeRoute => '/app-home';

  String get profileRoute => '/app-home/profile';

  @override
  String parentRoute = '/app-home';
}

class SplashRoutes implements AppRouteBase {
  SplashRoutes._();

  String get splash => '/splash';

  String get splashRoute => '/splash';

  @override
  String parentRoute = '/splash';
}
