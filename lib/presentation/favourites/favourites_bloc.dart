import 'package:bloc/bloc.dart';

import 'package:hacker_news/presentation/favourites/favourites_event.dart';
import 'package:hacker_news/presentation/favourites/favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState().init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<FavouritesState> emit) async {
    emit(state.clone());
  }
}
