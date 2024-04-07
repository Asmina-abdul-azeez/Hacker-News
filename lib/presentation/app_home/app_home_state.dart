// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class AppHomeState {

  AppHomeState({required this.tabIndex, required this.homeTabItems});
  int tabIndex;
  List<HomeTabItem> homeTabItems;

  AppHomeState init({int initialIndex = 0}) {
    return AppHomeState(tabIndex: initialIndex, homeTabItems: homeTabItems);
  }

  AppHomeState copyWith({
    int? tabIndex,
    List<HomeTabItem>? homeTabItems,
  }) {
    return AppHomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      homeTabItems: homeTabItems ?? this.homeTabItems,
    );
  }
}

class HomeTabItem {

  HomeTabItem(
      {required this.icon,
      required this.title,
        required this.selectedIcon,
      required this.isSelected,
      required this.page,});
  Icon icon;
  String title;
  bool isSelected;
  Widget page;
  Icon selectedIcon;
}
