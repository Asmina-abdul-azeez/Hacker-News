import 'package:bloc/bloc.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';
import 'package:hacker_news/domain/auth/use_cases/check_session_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/login_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/logout_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/store_session_use_case.dart';
import 'package:hacker_news/domain/auth/use_cases/verify_otp_use_case.dart';

import 'package:hacker_news/presentation/auth/auth_event.dart';
import 'package:hacker_news/presentation/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._verifyOtpUseCase,
    this._storeSessionUseCase,
    this._checkSessionUseCase,
      this._logoutUseCase,
  ) : super(AuthState().init()) {
    on<InitEvent>(_init);
  }

  final LoginUseCase _loginUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final StoreSessionUseCase _storeSessionUseCase;
  final CheckSessionUseCase _checkSessionUseCase;
  final LogoutUseCase _logoutUseCase;


  Future<void> _init(InitEvent event, Emitter<AuthState> emit) async {
    final session = await _checkSessionUseCase();
    if (session.isSuccess) {
      emit(LoggedInState(userAuth: session.data!));
    } else {
      emit(LoggedOutState());
    }
  }

  Future<Resource<bool>> generateOtp(String phoneNumber) async {
    final generated = await _loginUseCase(phoneNumber);
    return generated;
    // emit(LoggedInState(userAuth: UserAuth()));
  }

  Future<Resource<UserAuth>> verifyOtp(String otp) async {
    final generated = await _verifyOtpUseCase(otp);
    if (generated.isSuccess) {
      await _storeSessionUseCase(generated.data!);
      emit(LoggedInState(userAuth: generated.data!));
    }
    return generated;
  }

  void logout() {
    _logoutUseCase();
    emit(LoggedOutState());
  }
}
