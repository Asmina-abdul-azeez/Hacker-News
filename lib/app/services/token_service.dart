import 'package:injectable/injectable.dart';

abstract class TokenService {
  void storeToken();

  String? getToken();
}

@Singleton(as: TokenService)
class TokenServiceImpl extends TokenService {
  @override
  String? getToken() {
    return null;
  }

  @override
  void storeToken() {}
}
