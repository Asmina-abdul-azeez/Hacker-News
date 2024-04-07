import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/use_cases/change_theme_use_case.dart';
import 'package:hacker_news/domain/theme/use_cases/get_selected_theme_use_case.dart';
import 'package:hacker_news/domain/theme/use_cases/get_themes_use_case.dart';

import 'package:hacker_news/presentation/app_theme/app_theme_cubit.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_state.dart';

class AppThemeWrapper extends StatelessWidget {

  const AppThemeWrapper({
    required this.builder, super.key,
  });
  final Widget Function(
    BuildContext context,
    AppTheme? appTheme,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppThemeCubit(
          getSelectedThemeUseCase: getIt.get<GetSelectedThemeUseCase>(),
          getThemUseCase: getIt.get<GetThemeUseCase>(),
          changeThemeUseCase: getIt.get<ChangeThemeUseCase>(),),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
      return builder(context, state.appTheme);
    },);
  }
}
