import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/news/entities/news_hit.dart';
import 'package:hacker_news/domain/news/repositories/news_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetNewsUseCase {
  GetNewsUseCase({required this.newsRepo});

  NewsRepo newsRepo;

  Future<Resource<List<NewsHit>>> call() {
    return newsRepo.getNews();
  }
}
