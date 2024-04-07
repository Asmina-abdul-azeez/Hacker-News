import 'package:bloc/bloc.dart';

import 'package:hacker_news/presentation/sign_up/sign_up_event.dart';
import 'package:hacker_news/presentation/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState().init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<SignUpState> emit) async {
    emit(state.clone());
  }
}
