import 'package:hacker_news/domain/auth/entities/user_auth.dart';

class AuthState {
  AuthState init() {
    return LoggedOutState();
  }

  AuthState clone() {
    return LoggedOutState();
  }
}

class LoggedInState extends AuthState {
  LoggedInState({required this.userAuth});
  UserAuth userAuth;
}

class LoggedOutState extends AuthState {}

class GuestLoggedInState extends AuthState {}
