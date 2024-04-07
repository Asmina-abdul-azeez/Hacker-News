import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/auth/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class LoginUseCase {

  LoginUseCase({required this.authRepo});
  AuthRepo authRepo;

  Future<Resource<bool>> call(
    String phoneNumber,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return  authRepo.generateOtp();
  }
}
