import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:hacker_news/app/constants/app_constants.dart';
import 'package:hacker_news/app/services/local_storage_service.dart';
import 'package:hacker_news/domain/language/entities/language.dart';
import 'package:hacker_news/domain/language/repositories/language_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LanguageRepo)
/// The [LanguageRepoImpl] class...
class LanguageRepoImpl extends LanguageRepo {

  /// The [LanguageRepoImpl] constructor...
  LanguageRepoImpl({required this.localStorageService});

  /// The list of available languages.
  final availableLanguages = [
    const Language(name: 'English', locale: Locale('en', '')),
    const Language(name: 'Arabic', locale: Locale('ar', '')),
    const Language(name: 'Hindi', locale: Locale('hi', '')),
    const Language(name: 'Malayalam', locale: Locale('ml', '')),
  ];
  /// The [LocalStorageService] instance.
  LocalStorageService localStorageService;

  @override
  Future<Language> getLanguage() {
    final languageName =
        localStorageService.getItem(AppConstants.preferences.CURRENT_LANGUAGE);
    final language = availableLanguages
        .firstWhereOrNull((element) => element.name == languageName);
    return Future.value(
        language ?? const Language(name: 'English', locale: Locale('en', '')),);
  }

  @override
  Future<Language> setLanguage(Language language) {
    localStorageService.storeItem(
        key: AppConstants.preferences.CURRENT_LANGUAGE, value: language.name,);

    return Future.value(language);
  }

  @override
  Future<List<Language>> getAvailableLanguages() {
    return Future.value(availableLanguages);
  }
}
