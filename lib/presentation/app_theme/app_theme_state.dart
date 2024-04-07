import 'package:flutter/material.dart';
import 'package:hacker_news/domain/theme/entities/app_theme.dart';

class AppThemeState {

  AppThemeState({this.appTheme, this.availableThemes});
  AppTheme? appTheme;
  List<AppTheme>? availableThemes;

  AppThemeState init() {
    return AppThemeState(
        appTheme: AppTheme('default', ThemeData(), Colors.blue),);
  }

  AppThemeState copyWith({
    AppTheme? appTheme,
    List<AppTheme>? availableThemes,
  }) {
    return AppThemeState(
      appTheme: appTheme ?? this.appTheme,
      availableThemes: availableThemes ?? this.availableThemes,
    );
  }
}
