import 'package:flutter/foundation.dart';
import 'package:hacker_news/app/app_utils/logger.dart';
import 'package:hacker_news/app/errors/exceptions/app_exceptions.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/models/ui_message_model.dart';
import 'package:hacker_news/data/data-sources/network/api_response.dart';

/// Executes a given action safely and returns a [Resource] object.
///
/// This function is designed to wrap asynchronous operations and handle any
/// exceptions that occur, simplifying error handling and result processing.
///
/// Generic type [T] represents the type of data that the action returns.
///
/// [action] is a function that returns a [Future]. This is the operation that will be executed safely.
///
/// [fromJson] is an optional function that can be used to convert the result of the action into an object of type [T].
///   - It takes a dynamic parameter [json] which is the raw result from the action.
///
/// [showErrorMessages] is a boolean indicating whether error messages should be displayed.
///   - Defaults to `true`.
///
/// Returns a [Resource<T>] which can be either a success with data of type [T] or an error.
Future<Resource<T>> executeSafely<T>(
  Future<APIResponse> Function() action, {
  T Function(Map<String, dynamic> json)? fromJson,
  T Function(List<Map<String, dynamic>> jsonList)? fromJsonList,
  bool showErrorMessages = false,
  bool showBackendErrors = true,
  bool showSuccessMessage = false,
  bool skipParsingAndReturnBooleanStatus = false,
  UIMessageModel? uiSuccessMessageModel,
  UIMessageModel? uiErrorMessageModel,
  String? key
}) async {
  try {
    final result = await action();
    // If a [fromJson] function is provided, use it to transform the result, else cast the result to Type [T].
    if (fromJson != null) {
      final item =
          await compute(fromJson, result.data['data'] as Map<String, dynamic>);
      return Resource.success(
        item,
        uiMessageModel: showSuccessMessage
            ? uiSuccessMessageModel ?? defaultSuccessMessage
            : null,
      );
    } else if (fromJsonList != null) {
      final list = result.data[key ?? 'data'];
      final jsonList = <Map<String, dynamic>>[];
      list.forEach((element) {
        final mapElement = element as Map<String, dynamic>;
        jsonList.add(mapElement);
      });

      final modelList = await compute(fromJsonList, jsonList);
      appLogger
        ..d('parsing list')
        ..d(list)
        ..d(modelList);
      // final jsonList = List<Map<String, dynamic>>.from(data.map((e) => e));
      return Resource.success(
        modelList,
        uiMessageModel: showSuccessMessage
            ? uiSuccessMessageModel ?? defaultSuccessMessage
            : null,
      );
    }
    return Resource.success(
      result as T,
      uiMessageModel: showSuccessMessage
          ? uiSuccessMessageModel ?? defaultSuccessMessage
          : null,
    );
  } on AppException catch (e) {
    UIMessageModel? uiMessageModel;
    if (showErrorMessages) {
      if (uiErrorMessageModel != null) {
        uiMessageModel = uiErrorMessageModel;
      } else if (showBackendErrors) {
        uiMessageModel = UIMessageModel('Error', e.message);
      } else {
        uiMessageModel = UIMessageModel('Error', 'An error occurred');
      }
    }
    return Resource.error(
      e,
      uiMessageModel: uiMessageModel,
    );
  } catch (e, s) {
    print(e);
    appLogger
      ..d(e)
      ..d('error', error: s.toString());
    // In case of an error, return a [Resource.error] with the caught exception and an optional UI message.

    return Resource.error(
      e,
      uiMessageModel:
          showErrorMessages ? uiErrorMessageModel ?? defaultErrorMessage : null,
    );
  }
}

final defaultSuccessMessage = UIMessageModel('Success', 'Operation Successful');
final defaultErrorMessage = UIMessageModel('Error', 'An error occurred');
