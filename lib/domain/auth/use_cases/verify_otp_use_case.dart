// ignore_for_file: inference_failure_on_instance_creation

import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';
import 'package:hacker_news/domain/auth/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class VerifyOtpUseCase {

  VerifyOtpUseCase({required this.authRepo});
  AuthRepo authRepo;

  Future<Resource<UserAuth>> call(String otp) async {
    await Future.delayed(const Duration(seconds: 1));
    return authRepo.verifyOtp();
  }
}
