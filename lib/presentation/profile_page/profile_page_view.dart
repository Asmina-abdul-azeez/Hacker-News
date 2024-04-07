import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/constants/screen_constants.dart';
import 'package:hacker_news/app/extensions/build_context_extension.dart';
import 'package:hacker_news/app/widgets/sized_boxes.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_cubit.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_state.dart';
import 'package:hacker_news/presentation/app_theme/utils/theme_utils.dart';
import 'package:hacker_news/presentation/auth/auth_bloc.dart';
import 'package:hacker_news/presentation/language/language_cubit.dart';
import 'package:hacker_news/presentation/language/language_state.dart';
import 'package:hacker_news/presentation/profile_page/profile_page_bloc.dart';
import 'package:hacker_news/presentation/profile_page/profile_page_event.dart';

/// A StatelessWidget for displaying user profile information.
class ProfileView extends StatelessWidget {
  // Constructor for ProfileView
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Creating a Bloc for managing the state of the profile page
      create: (BuildContext context) => ProfilePageBloc()..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  // Private method to build the UI of the profile page
  Widget _buildPage(BuildContext context) {
    // Retrieving necessary BLoCs for state management
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final languageCubit = BlocProvider.of<LanguageCubit>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          verticalBox8,
          // Displaying user's profile picture
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/139426?s=400&u=8e2e0d9e4a3e4e4b5b6b5e4e4b5b6b5e4e4b5b6b&v=4',),
          ),
          verticalBox8,
          // Building UI components based on AppThemeCubit state
          BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.all(ScreenConstants.defaultScreenPadding),
                child: Column(
                  children: [
                    // Theme selector button
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                ThemeUtils.showThemeSelector(context);
                              },
                              child: Text(context.l.select_theme),),
                        ],
                      ),
                    ),
                    // Logout button
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: authBloc.logout,
                              child: Text(context.l.logout),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },),
          // Building UI components based on LanguageCubit state
          BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, LanguageState state) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.all(ScreenConstants.defaultScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (state.availableLanguages ?? [])
                      .map((e) => InkWell(
                          onTap: () {
                            languageCubit.changeLanguage(e);
                          },
                          child: Text(e.name),),)
                      .toList(),
                ),
              ),
            );
          },),
        ],
      ),
    );
  }
}
