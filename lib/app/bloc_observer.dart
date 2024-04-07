import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/app_utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    appLogger.d(event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    appLogger..d(bloc)
    ..d(change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    appLogger.d(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    appLogger.d(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    appLogger.e(error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
