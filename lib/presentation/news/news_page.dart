import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/app/routes/router.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/app/services/web_view_service.dart';
import 'package:hacker_news/app/widgets/base_view.dart';
import 'package:hacker_news/app/widgets/sized_boxes.dart';
import 'package:hacker_news/domain/news/use_cases/get_news_use_case.dart';
import 'package:hacker_news/presentation/news/news_bloc.dart';
import 'package:hacker_news/presentation/news/news_event.dart';
import 'package:hacker_news/presentation/news/news_state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        getNewsUseCase: getIt.get<GetNewsUseCase>(),
        webViewService: getIt.get<WebViewService>(),
      )..add(GetNewsListEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Text(
                'Hacker News',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalBox8,
              Expanded(
                child: _buildList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return BaseView(
          resource: state.newsList,
          onSuccess: (list) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  onTap: () {
                    router.go(
                      Routes.appRoutes.webViewRoute,
                      extra: item.url,
                    );
                  },
                  // onTap: () => newsBloc.add(LoadWebview(url: item.url ?? '')),
                  leading: Text(
                    (item.points ?? '').toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  title: Text(
                    item.title ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
