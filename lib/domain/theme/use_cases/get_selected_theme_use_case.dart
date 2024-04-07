import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/domain/theme/repository/theme_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetSelectedThemeUseCase {

  GetSelectedThemeUseCase({required this.themeRepo});
  ThemeRepo themeRepo;

  Future<AppTheme?> call() async {
    return themeRepo.getSelectedTheme();
  }
}
