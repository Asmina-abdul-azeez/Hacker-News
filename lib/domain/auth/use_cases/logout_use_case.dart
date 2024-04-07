import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LogoutUseCase {
  LogoutUseCase({required this.localStorageService});
  
  LocalStorageService localStorageService;

  Future<Resource<bool>> call(
  ) async {
    localStorageService.clear();
    await Future.delayed(const Duration(seconds: 1));
    return  Future.value(Resource.success(true));
  }
}
