import 'dart:convert';

import 'package:hacker_news/app/constants/app_constants.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/services/local_storage_service.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class StoreSessionUseCase {

  StoreSessionUseCase({required this.localStorageService});
  LocalStorageService localStorageService;

  Future<Resource<UserAuth>> call(UserAuth userAuth) async {
    await Future.delayed(const Duration(seconds: 1));
    localStorageService.storeItem(
        key: AppConstants.preferences.USER_AUTH,
        value: json.encode(userAuth.toMap()),);
    return Future.value(Resource.success(UserAuth()));
    }
}
