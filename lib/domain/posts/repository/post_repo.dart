import 'package:hacker_news/domain/posts/entities/posts.dart';

abstract class PostRepo {
  Future<List<Post>> fetchPosts();
}
