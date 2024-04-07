import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/domain/language/entities/language.dart';
import 'package:hacker_news/domain/language/use_cases/get_available_languages_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/get_selected_language_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/set_languages_use_case.dart';
import 'package:hacker_news/presentation/language/language_cubit.dart';
import 'package:hacker_news/presentation/language/language_state.dart';

class LanguageWrapper extends StatelessWidget {

  const LanguageWrapper({required this.builder, super.key});
  final Widget Function(
    BuildContext context,
    Language? appTheme,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LanguageCubit(
          getSelectedLanguageUseCase: getIt.get<GetSelectedLanguageUseCase>(),
          getAvailableLanguagesUseCase:
              getIt.get<GetAvailableLanguagesUseCase>(),
          setSelectedLanguageUseCase: getIt.get<SetLanguageUseCase>(),),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, LanguageState state) {
          return builder(context, state.currentSelectedLanguage);
        },
      ),
    );
  }
}
