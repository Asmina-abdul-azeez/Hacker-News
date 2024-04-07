import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/repository/theme_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class GetThemeUseCase {

  GetThemeUseCase({required this.themeRepo});
  ThemeRepo themeRepo;

  Future<List<AppTheme>> call() async {
    return themeRepo.getAvailableThemes();
  }
}
