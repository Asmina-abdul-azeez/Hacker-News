// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:hacker_news/app/constants/screen_constants.dart';

Widget AppPadding(Widget child) => Padding(
      padding:
          const EdgeInsets.all(ScreenConstants.defaultScreenPadding),
      child: child,
    );
