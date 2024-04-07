import 'package:hacker_news/domain/posts/entities/posts.dart';

class HomePageState {

  HomePageState({required this.posts, required this.loading});

  factory HomePageState.init() {
    return HomePageState(posts: [], loading: false);
  }
  bool loading;
  List<Post> posts;

  HomePageState copyWith({
    bool? loading,
    List<Post>? posts,
  }) {
    return HomePageState(
      loading: loading ?? this.loading,
      posts: posts ?? this.posts,
    );
  }
}
