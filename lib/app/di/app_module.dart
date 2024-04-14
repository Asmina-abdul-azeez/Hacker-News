import 'package:dio/dio.dart';
import 'package:hacker_news/app/models/env_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {

  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @injectable
  Future<Dio> loadDio({required EnvModel envModel}) async {
    return Dio(BaseOptions(baseUrl: envModel.baseUrl));
  }

  @preResolve
  Future<EnvModel> loadEnvFile() async {
    await dotenv.load();
    return EnvModel(baseUrl: dotenv.env['baseUrl'] ?? '');
  }
}
