import 'package:bloc/bloc.dart';

import 'package:hacker_news/presentation/forgot_password/forgot_password_event.dart';
import 'package:hacker_news/presentation/forgot_password/forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState().init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.clone());
  }
}
