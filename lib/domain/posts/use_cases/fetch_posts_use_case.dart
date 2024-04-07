import 'package:hacker_news/domain/posts/entities/posts.dart';
import 'package:hacker_news/domain/posts/repository/post_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class FetchPostsUseCase {

  FetchPostsUseCase({required this.postRepo});
  PostRepo postRepo;

  Future<List<Post>> call(int number) async{
    await Future.delayed(const Duration(seconds: 4));
    return postRepo.fetchPosts();
  }
}
