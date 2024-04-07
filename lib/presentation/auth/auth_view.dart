import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/app/routes/router.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/domain/auth/use_cases/check_session_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/login_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/logout_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/store_session_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/verify_otp_use_case.dart';

import 'package:hacker_news/presentation/auth/auth_bloc.dart';
import 'package:hacker_news/presentation/auth/auth_event.dart';
import 'package:hacker_news/presentation/auth/auth_state.dart';

class AuthWrapper extends StatelessWidget {

  const AuthWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(
          getIt.get<LoginUseCase>(),
          getIt.get<VerifyOtpUseCase>(),
          getIt.get<StoreSessionUseCase>(),
          getIt.get<CheckSessionUseCase>(),getIt.get<LogoutUseCase>(),)
        ..add(InitEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, AuthState authState) {
          if (authState is LoggedInState) {
            router.go(Routes.appRoutes.parentRoute);
          }
          if (authState is LoggedOutState) {
            router.go(Routes.authRoutes.parentRoute);
          }
        },
        child: child,
      ),
    );
  }
}
