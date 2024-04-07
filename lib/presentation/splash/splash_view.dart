import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/presentation/splash/splash_bloc.dart';
import 'package:hacker_news/presentation/splash/splash_event.dart';
import 'package:hacker_news/presentation/splash/splash_state.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashBloc()..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (BuildContext context, state) {
        if (state.splashFinished) {
          context.go(Routes.authRoutes.parentRoute);
        }
      },
      child: const Scaffold(),
    );
  }
}
