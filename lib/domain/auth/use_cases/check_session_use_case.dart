// ignore_for_file: inference_failure_on_instance_creation

import 'dart:convert';

import 'package:hacker_news/app/constants/app_constants.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/services/local_storage_service.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';
import 'package:injectable/injectable.dart';

/// The [CheckSessionUseCase] class... for
/// checking if the user is already logged in or not.
@Singleton()
class CheckSessionUseCase {
  /// The [CheckSessionUseCase] constructor...
  CheckSessionUseCase({required this.localStorageService});

  /// The [LocalStorageService] instance.
  LocalStorageService localStorageService;

  /// The [call] method... for checking
  /// if the user is already logged in or not.
  Future<Resource<UserAuth>> call() async {
    await Future.delayed(const Duration(seconds: 1));
    final userAuth =
        localStorageService.getItem(AppConstants.preferences.USER_AUTH);
    if (userAuth != null) {
      return Future.value(
        Resource.success(
          UserAuth.fromMap(json.decode(userAuth) as Map<String, dynamic>),
        ),
      );
    } else {
      return Future.value(Resource.error('User not logged in'));
    }
  }
}
