import 'package:hacker_news/domain/language/entities/language.dart';

abstract class LanguageRepo {
  Future<List<Language>> getAvailableLanguages();
  Future<Language> getLanguage();
  Future<Language> setLanguage(Language language);
}
