import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/widgets/app_loader.dart';
import 'package:hacker_news/data/repositories/post_repo_impl.dart';
import 'package:hacker_news/domain/posts/use_cases/fetch_posts_use_case.dart';

import 'package:hacker_news/presentation/home_page/home_page_bloc.dart';
import 'package:hacker_news/presentation/home_page/home_page_event.dart';
import 'package:hacker_news/presentation/home_page/home_page_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          HomePageBloc(FetchPostsUseCase(postRepo: PostRepoImpl()))
            ..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {

    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return Scaffold(
        body: Column(
          children: [
            if (state.loading) const AppLoader() else Expanded(
                    child: ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, index) {
                          final post = state.posts[index];
                          return Card(
                            child: Column(
                              children: [
                                Image.network(post.imageUrl),
                                Text(post.subTitle),
                              ],
                            ),
                          );
                        },),),
          ],
        ),
      );
    },);
  }
}
