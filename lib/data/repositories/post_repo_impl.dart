import 'package:hacker_news/domain/posts/entities/posts.dart';
import 'package:hacker_news/domain/posts/repository/post_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepo)
class PostRepoImpl extends PostRepo {
  @override
  Future<List<Post>> fetchPosts() {
    return Future.value([
      Post(
          name: 'Post1 ',
          imageUrl: 'https://picsum.photos/200/300',
          subTitle: 'sdflsjkdf',),
      Post(
          name: 'Post1 ',
          imageUrl: 'https://picsum.photos/200/300',
          subTitle: 'sdflsjkdf',),
      Post(
          name: 'Post1 ',
          imageUrl: 'https://picsum.photos/200/300',
          subTitle: 'sdflsjkdf',),
    ]);
  }
}
