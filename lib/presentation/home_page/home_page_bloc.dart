import 'package:bloc/bloc.dart';
import 'package:hacker_news/domain/posts/use_cases/fetch_posts_use_case.dart';

import 'package:hacker_news/presentation/home_page/home_page_event.dart';
import 'package:hacker_news/presentation/home_page/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this._fetchPostsUseCase) : super(HomePageState.init()) {
    on<InitEvent>(_init);
  }

  final FetchPostsUseCase _fetchPostsUseCase;

  Future<void> _init(InitEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(loading: true));
    emit(state.copyWith(loading: false, posts: await _fetchPostsUseCase(10)));
  }
}
