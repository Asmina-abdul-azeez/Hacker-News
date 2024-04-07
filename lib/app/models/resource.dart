import 'package:hacker_news/app/models/ui_message_model.dart';

sealed class Resource<T> {
  const Resource._();

  factory Resource.initial() => const ResourceInitial();

  factory Resource.success(T data, {UIMessageModel? uiMessageModel}) =>
      ResourceSuccess(data, successMessage: uiMessageModel);

  factory Resource.error(Object error, {UIMessageModel? uiMessageModel}) =>
      ResourceError(error, errorMessage: uiMessageModel);

  factory Resource.loading() => const ResourceLoading();

  bool get isLoading => this is ResourceLoading;

  bool get isInitial => this is ResourceInitial;

  bool get isSuccess => this is ResourceSuccess;

  bool get isError => this is ResourceError;

  T? get data => this is ResourceSuccess ? this.data : null;

  Object? get error => this is ResourceError ? this.error : null;
}

class ResourceInitial<T> extends Resource<T> {
  const ResourceInitial() : super._();
}

class ResourceSuccess<T> extends Resource<T> {

  const ResourceSuccess(this.data, {this.successMessage}) : super._();
  @override
  final T data;
  final UIMessageModel? successMessage;
}

class ResourceError<T> extends Resource<T> {

  const ResourceError(this.error, {this.errorMessage}) : super._();
  @override
  final Object error;
  final UIMessageModel? errorMessage;
}

class ResourceLoading<T> extends Resource<T> {
  const ResourceLoading() : super._();
}
