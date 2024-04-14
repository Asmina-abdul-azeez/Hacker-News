import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/app/models/ui_message_model.dart';
import 'package:hacker_news/data/data-sources/network'
    '/api_request_representable.dart';
import 'package:hacker_news/data/data-sources/network'
    '/network_service.dart';
import 'package:hacker_news/domain/auth/entities/user_auth.dart';
import 'package:hacker_news/domain/auth/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {

  AuthRepoImpl({required this.networkService});
  NetworkService networkService;

  @override
  Future<Resource<bool>> generateOtp() {
    try {
      networkService.post(APIRequestRepresentable(url: 'dfs'));
      // return Future.value(Resource.error(AppException(),
      //     uiMessageModel: UIMessageModel("Error", "Failed to generate OTP",
      //         showMessage: true)));
      return Future.value(Resource.success(true,
          uiMessageModel:
              UIMessageModel('Success', 'OTP generated successfully'),),);
    } catch (e) {
      return Future.value(Resource.error(e));
    }
  }

  @override
  Future<Resource<UserAuth>> verifyOtp() {
    try {
      networkService.post(APIRequestRepresentable(url: 'dfs'));
      return Future.value(Resource.success(UserAuth()));
    } catch (e) {
      return Future.value(Resource.error(e));
    }
  }
}
