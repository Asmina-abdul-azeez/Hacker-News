import 'package:flutter/material.dart';
import 'package:hacker_news/app/config/dimens.dart';
import 'package:hacker_news/app/widgets/app_loader.dart';

class AppButton extends StatelessWidget {

  const AppButton({
    required this.onPressed, required this.label, super.key,
    this.loading = false,
    this.enabled = false,
  });
  final bool loading;
  final bool enabled;
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SizedBox(width: SW.size12, child: AppLoader());
    }
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: !enabled || loading ? null : onPressed,
          child: loading
              ? const SizedBox(width: SW.size12, child: AppLoader())
              : Text(label),),
    );
  }
}
