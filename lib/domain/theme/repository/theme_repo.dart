import 'package:hacker_news/domain/theme/entities/app_theme.dart';

abstract class ThemeRepo {
  Future<AppTheme> changeTheme(AppTheme appTheme);

  Future<List<AppTheme>> getAvailableThemes();

  Future<AppTheme?> getSelectedTheme() ;
}
