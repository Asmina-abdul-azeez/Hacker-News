import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/repository/theme_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()


class ChangeThemeUseCase {

  ChangeThemeUseCase({required this.themeRepo});
  ThemeRepo themeRepo;

  Future<AppTheme> call(AppTheme appTheme) async {
    return themeRepo.changeTheme(appTheme);
  }
}
