import 'package:bloc/bloc.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/use_cases/change_theme_use_case.dart';
import 'package:hacker_news/domain/theme/use_cases/get_selected_theme_use_case.dart';
import 'package:hacker_news/domain/theme/use_cases/get_themes_use_case.dart';

import 'package:hacker_news/presentation/app_theme/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {

  AppThemeCubit(
      {required this.getThemUseCase,
      required this.changeThemeUseCase,
      required this.getSelectedThemeUseCase,})
      : super(AppThemeState().init()) {
    getInitialTheme();
  }
  GetThemeUseCase getThemUseCase;
  ChangeThemeUseCase changeThemeUseCase;
  GetSelectedThemeUseCase getSelectedThemeUseCase;

 Future<void> getInitialTheme() async {
    final availableThemes = await getThemUseCase();
    final selectedTheme =
        await getSelectedThemeUseCase() ?? availableThemes[0];
    emit(state.copyWith(
        availableThemes: availableThemes, appTheme: selectedTheme,),);
  }

 Future<void> changeTheme(AppTheme appTheme) async {
    emit(state.copyWith(appTheme: await changeThemeUseCase(appTheme)));
  }
}
