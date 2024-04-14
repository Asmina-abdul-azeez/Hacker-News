import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/news/entities/news_hit.dart';

abstract class NewsRepo {
  Future<Resource<List<NewsHit>>> getNews();
}