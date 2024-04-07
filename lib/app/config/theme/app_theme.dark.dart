import 'package:flutter/material.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';

final appDarkTheme = AppTheme(
    'APP_THEME_DARK',
    ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, brightness: Brightness.dark,),),Colors.red,);
