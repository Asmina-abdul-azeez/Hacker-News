import 'package:flutter/foundation.dart';
import 'package:hacker_news/app/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
///declaring getIt instance to every where in the app
final getIt = GetIt.instance;

///service env for getIT
class ServiceEnv {
  const ServiceEnv._();

  ///constant when running the app
  static const String app = 'app';

  ///constant when running the app
  static const String webapp = 'webapp';

  ///constant when running in test
  static const String test = 'test';

  ///constant when running integration
  static const String integrationTest = 'integration_test';

  ///common list constant for both webapp and app
  static const appEnv = [app, webapp];
}

@InjectableInit()
Future<void> configureInjection() async {
  await getIt.init(environment: kIsWeb ? ServiceEnv.webapp : ServiceEnv.app);
  await getIt.allReady();
}

///configuring test injection
Future<void> configureTestInjection() async {
  await getIt.init(environment: ServiceEnv.test);
}

///configuring test injection
Future<void> configureIntegrationTestInjection() async {
  await getIt.init(environment: ServiceEnv.integrationTest);
}
