import 'package:flutter/material.dart';
import 'package:hacker_news/app/config/dimens.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: SizedBox(
        width: SW.size35, // Set the fixed width
        height:SW.size35,
        child: FittedBox(
          child: CircularProgressIndicator(
            strokeWidth: SW.size7,
          ),
        ),
      ),
    );
  }
}
