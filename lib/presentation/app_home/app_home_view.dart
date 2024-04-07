import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/presentation/app_home/app_home_cubit.dart';
import 'package:hacker_news/presentation/app_home/app_home_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppHomeCubit(),
      child: Builder(builder: _buildPage),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<AppHomeCubit>(context);

    final tabTranslations = {
      'home': AppLocalizations.of(context)!.home,
      'favorites': AppLocalizations.of(context)!.favorites,
      'profile': AppLocalizations.of(context)!.profile,
    };

    return BlocBuilder<AppHomeCubit, AppHomeState>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.tabIndex,
          onTap: cubit.onChangeTab,
          items: state.homeTabItems
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(
                    e.icon.icon,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  activeIcon: Icon(
                    e.selectedIcon.icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: tabTranslations[e.title.toLowerCase()] ?? e.title,),)
              .toList(),
        ),
        body: IndexedStack(
          index: state.tabIndex,
          children: state.homeTabItems.map((e) => e.page).toList(),
        ),
      );
    },);
  }
}
