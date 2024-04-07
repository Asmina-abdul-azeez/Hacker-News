import 'package:flutter/material.dart';
import 'package:hacker_news/presentation/app_theme/widgets/theme.selector.dart';

class ThemeUtils {
  static void showThemeSelector(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
              backgroundColor: Colors.transparent,
              child: ThemeSelector(),);
        },);
  }
}
