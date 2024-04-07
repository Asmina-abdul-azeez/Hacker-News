import 'package:dio/dio.dart';
import 'package:hacker_news/app/models/env_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<EnvModel> loadEnvFile() async {
    await dotenv.load();
    return EnvModel(baseUrl: dotenv.env['BASE_URL'] ?? '');
  }
}
