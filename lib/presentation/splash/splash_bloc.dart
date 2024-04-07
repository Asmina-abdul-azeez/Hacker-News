import 'package:bloc/bloc.dart';

import 'package:hacker_news/presentation/splash/splash_event.dart';
import 'package:hacker_news/presentation/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState().init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<SplashState> emit) async {
    emit(state.clone());
    await Future.delayed(const Duration(milliseconds: 2000));
    emit(state.closeSplash());
  }
}
