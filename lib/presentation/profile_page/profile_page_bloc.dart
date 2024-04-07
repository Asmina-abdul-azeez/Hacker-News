import 'package:bloc/bloc.dart';

import 'package:hacker_news/presentation/profile_page/profile_page_event.dart';
import 'package:hacker_news/presentation/profile_page/profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageState.init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<ProfilePageState> emit) async {
    emit(ProfilePageState.clone());
  }
}
