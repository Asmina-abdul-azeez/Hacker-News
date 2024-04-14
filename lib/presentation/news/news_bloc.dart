import 'package:bloc/bloc.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/services/web_view_service.dart';
import 'package:hacker_news/domain/news/use_cases/get_news_use_case.dart';
import 'package:hacker_news/presentation/news/news_event.dart';
import 'package:hacker_news/presentation/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.getNewsUseCase, required this.webViewService})
      : super(NewsState.initial()) {
    on<GetNewsListEvent>(getNewsList);
    on<LoadWebview>(loadWebview);
  }

  final GetNewsUseCase getNewsUseCase;
  final WebViewService webViewService;

  Future<void> getNewsList(
      GetNewsListEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(newsList: const ResourceLoading()));
    final news = await getNewsUseCase();
    emit(state.copyWith(newsList: news));
  }

  void loadWebview(LoadWebview event, Emitter<NewsState> emit) {
  webViewService.loadRequest(url: event.url);
  }
}
