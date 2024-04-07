import 'package:hacker_news/domain/language/entities/language.dart';
import 'package:hacker_news/domain/language/repositories/language_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetSelectedLanguageUseCase {

  GetSelectedLanguageUseCase({required this.languageRepo});
  LanguageRepo languageRepo;

  Future<Language> call() async {
    return languageRepo.getLanguage();
  }
}
