import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';

abstract class AuthRepo {
  Future<Resource<bool>> generateOtp();

  Future<Resource<UserAuth>> verifyOtp();

}
