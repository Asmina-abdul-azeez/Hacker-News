import 'package:hacker_news/app/constants/app_constants.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/data/data-sources/network/api_request_representable.dart';
import 'package:hacker_news/data/data-sources/network/execute_safely.dart';
import 'package:hacker_news/data/data-sources/network/network_service.dart';
import 'package:hacker_news/domain/news/entities/news_hit.dart';
import 'package:hacker_news/domain/news/repositories/news_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRepoImpl({required this.networkService});

  NetworkService networkService;
  @override
  Future<Resource<List<NewsHit>>> getNews() async {
    try {
      final response = await executeSafely(() {
        return networkService
            .get(APIRequestRepresentable(url: AppConstants.endPoints.getNews));
      },
          fromJsonList: (List<Map<String, dynamic>> jsonList) =>
              jsonList.map(NewsHit.fromJson).toList(),
              key: 'hits'
              );
      return response;
    } catch (e) {
      return Future.value(ResourceError(e));
    }
  }
}
