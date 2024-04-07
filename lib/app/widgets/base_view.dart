import 'package:flutter/material.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/models/ui_message_model.dart';

/// A generic base view widget that handles different states of a resource.
class BaseView<T> extends StatelessWidget {

  /// Constructor for the BaseView.
  const BaseView({
    required this.resource, required this.onSuccess, super.key,
    this.onErrorBuilder,
    this.onLoadingBuilder,
    this.onInitialBuilder,
  });
  final Resource<T> resource;
  final Widget Function(T data) onSuccess;
  final Widget Function(Object error, UIMessageModel? errorMessage)?
      onErrorBuilder;
  final Widget Function()? onLoadingBuilder;
  final Widget Function()? onInitialBuilder;

  @override
  Widget build(BuildContext context) {
    if (resource.isInitial) {
      return onInitialBuilder?.call() ?? _defaultInitialWidget();
    } else if (resource.isLoading) {
      return onLoadingBuilder?.call() ?? _defaultLoadingWidget();
    } else if (resource.isError) {
      final error = resource.error!;
      final errorMessage = (resource as ResourceError).errorMessage;

      // Show an error snackBar after the build is complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorSnackBar(context, errorMessage?.title, errorMessage?.message);
      });

      return onErrorBuilder?.call(error, errorMessage) ??
          _defaultErrorWidget(error);
    } else if (resource.isSuccess) {
      // Show a success snackBar after the build is complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if ((resource as ResourceSuccess).successMessage?.showMessage ??
            false) {
          _showSuccessSnackBar(
              context,
              (resource as ResourceSuccess).successMessage?.title,
              (resource as ResourceSuccess).successMessage?.message,);
        }
      });

      return onSuccess((resource as ResourceSuccess).data as T);
    } else {
      // Handle other states or return an empty container as a default.
      return Container();
    }
  }
}

/// Default widget to display during the initial state.
Widget _defaultInitialWidget() {
  return const Center(
    child: Text('Initializing...'),
  );
}

/// Default widget to display during the loading state.
Widget _defaultLoadingWidget() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

/// Default widget to display during an error state.
Widget _defaultErrorWidget(Object error) {
  return Center(child: Text('Error: $error'));
}

/// Helper method to show an error snackBar with an optional title.
void _showErrorSnackBar(
    BuildContext context, String? errorTitle, String? errorMessage,) {
  if (errorMessage != null && errorMessage.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (errorTitle != null && errorTitle.isNotEmpty) Text(errorTitle),
            Text(errorMessage),
          ],
        ),
        duration: const Duration(milliseconds: 100),
      ),
    );
  }
}

void _showSuccessSnackBar(
    BuildContext context, String? successTitle, String? successMessage,) {
  if (successMessage != null && successMessage.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (successTitle != null && successTitle.isNotEmpty)
              Text(successTitle),
            Text(successMessage),
          ],
        ),
      ),
    );
  }
}
