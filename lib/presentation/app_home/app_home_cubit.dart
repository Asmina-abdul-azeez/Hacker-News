import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/presentation/app_home/app_home_state.dart';
import 'package:hacker_news/presentation/favourites/favourites_view.dart';
import 'package:hacker_news/presentation/home_page/home_page_view.dart';
import 'package:hacker_news/presentation/profile_page/profile_page_view.dart';

/// The [AppHomeCubit] class...
class AppHomeCubit extends Cubit<AppHomeState> {
  ///constructor
  AppHomeCubit()
      : super(
          AppHomeState(
            tabIndex: 0,
            homeTabItems: [
              HomeTabItem(
                icon: const Icon(Icons.home),
                title: 'Home',
                selectedIcon: const Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                isSelected: false,
                page: const HomePageView(),
              ),
              HomeTabItem(
                icon: const Icon(Icons.favorite),
                selectedIcon: const Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
                title: 'Favorites',
                page: const FavouritesView(),
                isSelected: false,
              ),
              HomeTabItem(
                icon: const Icon(Icons.person),
                selectedIcon: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: 'profile',
                page: const ProfileView(),
                isSelected: false,
              ),
            ],
          ).init(),
        );

  ///for changing the tab
  Future<void> onChangeTab(int index) async {
    emit(state.copyWith(tabIndex: index));
  }
}
