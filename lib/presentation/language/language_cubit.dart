import 'package:bloc/bloc.dart';
import 'package:hacker_news/domain/language/entities/language.dart';
import 'package:hacker_news/domain/language/use_cases/get_available_languages_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/get_selected_language_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/set_languages_use_case.dart';

import 'package:hacker_news/presentation/language/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {

  LanguageCubit(
      {required this.getAvailableLanguagesUseCase,
      required this.getSelectedLanguageUseCase,
      required this.setSelectedLanguageUseCase,})
      : super(LanguageState().init()) {
    fetchLanguages();
    getSelectedLanguage();
  }
  GetSelectedLanguageUseCase getSelectedLanguageUseCase;
  GetAvailableLanguagesUseCase getAvailableLanguagesUseCase;
  SetLanguageUseCase setSelectedLanguageUseCase;

 void  changeLanguage(Language language) {
    setSelectedLanguageUseCase(language).then((value) async => emit(
        state.copyWith(
            currentSelectedLanguage:
                await setSelectedLanguageUseCase(language),),),);
  }

  void getSelectedLanguage() {
    getSelectedLanguageUseCase().then((value) {
      emit(state.copyWith(currentSelectedLanguage: value));
    });
  }

  void fetchLanguages() {
    getAvailableLanguagesUseCase()
        .then((value) => emit(state.copyWith(availableLanguages: value)));
  }
}
