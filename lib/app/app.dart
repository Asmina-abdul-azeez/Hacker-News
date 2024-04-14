// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/app/app_utils/logger.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/app/routes/router.dart';
import 'package:hacker_news/domain/language/entities/language.dart';
import 'package:hacker_news/domain/language/use_cases/get_available_languages_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/get_selected_language_use_case.dart';
import 'package:hacker_news/domain/language/use_cases/set_languages_use_case.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_view.dart';
import 'package:hacker_news/presentation/auth/auth_view.dart';
import 'package:hacker_news/presentation/language/language_cubit.dart';
import 'package:hacker_news/presentation/language/language_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: AuthWrapper(
        child: AppThemeWrapper(
          builder: (context, AppTheme? appTheme) {
            return LanguageWrapper(
              builder: (context, Language? language) {
                appLogger.d('language: $language');
                return MaterialApp.router(
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routerConfig: router,
                  title: 'Flutter Demo',
                  locale: language?.locale,
                  theme: appTheme?.themeData,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
