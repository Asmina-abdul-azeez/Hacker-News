import 'package:hacker_news/domain/language/entities/language.dart';

class LanguageState {

  LanguageState({this.currentSelectedLanguage, this.availableLanguages});
  Language? currentSelectedLanguage;
  List<Language>? availableLanguages;

  LanguageState init() {
    return LanguageState();
  }

  LanguageState clone() {
    return LanguageState();
  }

  LanguageState copyWith({
    Language? currentSelectedLanguage,
    List<Language>? availableLanguages,
  }) {
    return LanguageState(
      currentSelectedLanguage:
          currentSelectedLanguage ?? this.currentSelectedLanguage,
      availableLanguages: availableLanguages ?? this.availableLanguages,
    );
  }
}
