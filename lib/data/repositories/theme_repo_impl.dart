import 'package:collection/collection.dart';
import 'package:hacker_news/app/config/theme/app_theme.dark.dart';
import 'package:hacker_news/app/config/theme/app_theme_2.dart';
import 'package:hacker_news/app/config/theme/app_theme_3.dart';
import 'package:hacker_news/app/config/theme/app_theme_light.dart';
import 'package:hacker_news/app/constants/app_constants.dart';
import 'package:hacker_news/app/services/local_storage_service.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/repository/theme_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ThemeRepo)
class ThemeRepoImpl extends ThemeRepo {

  ThemeRepoImpl({required this.localStorageService});
  LocalStorageService localStorageService;

  @override
  Future<AppTheme> changeTheme(AppTheme appTheme) async {
    localStorageService.storeItem(
        key: AppConstants.preferences.CURRENT_THEME, value: appTheme.themeKey,);
    return appTheme;
  }

  @override
  Future<List<AppTheme>> getAvailableThemes() {
    return Future.value([appLightTheme, appDarkTheme, appTheme2, appTheme3]);
  }

  @override
  Future<AppTheme?> getSelectedTheme() async {
    final themeKey =
        localStorageService.getItem(AppConstants.preferences.CURRENT_THEME);
    final themes = await getAvailableThemes();
    final selectedTheme =
        themes.firstWhereOrNull((element) => element.themeKey == themeKey);
    return Future.value(selectedTheme);
  }
}
