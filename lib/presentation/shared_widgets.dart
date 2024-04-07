import 'package:flutter/material.dart';
import 'package:hacker_news/app/constants/screen_constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key, this.label, this.error, this.onChanged, this.textInputType,});

  final String? label;
  final String? error;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(label!, style: Theme.of(context).textTheme.labelSmall),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenConstants.roundBorderRadius),
              ),
            ),
          ),
          onChanged: onChanged,
          keyboardType: textInputType,
        ),
        if (error != null)
          Text(
            error!,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
      ],
    );
  }
}
