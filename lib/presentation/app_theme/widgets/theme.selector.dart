import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_cubit.dart';
import 'package:hacker_news/presentation/app_theme/app_theme_state.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<AppThemeCubit>(context);
    return BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
      return Container(
        color: state.appTheme?.themeData.colorScheme.primary.withOpacity(.3),
        child: Wrap(
          children: [
            ...(state.availableThemes ?? [])
                .map((e) => InkWell(
                      onTap: () {
                        themeCubit.changeTheme(e);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: e.themeKey == state.appTheme?.themeKey
                                ? Border.all(
                                    width: 10,
                                    color:
                                        Theme.of(context).colorScheme.outline,)
                                : null,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                stops: const [
                                  .5,
                                  .5,
                                ],
                                colors: [
                                  e.themeData.colorScheme.primary,
                                  e.themeData.colorScheme.secondary,
                                ],),),
                      ),
                    ),)
                ,
          ],
        ),
      );
    },);
  }
}
