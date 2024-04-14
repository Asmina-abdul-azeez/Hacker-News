// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hacker_news/app/app_utils/validations/validations.dart' as _i5;
import 'package:hacker_news/app/di/app_module.dart' as _i36;
import 'package:hacker_news/app/models/env_model.dart' as _i4;
import 'package:hacker_news/app/services/local_storage_service.dart' as _i10;
import 'package:hacker_news/app/services/secure_storage_service.dart' as _i9;
import 'package:hacker_news/app/services/token_service.dart' as _i8;
import 'package:hacker_news/app/services/web_view_service.dart' as _i11;
import 'package:hacker_news/data/data-sources/network/dio/dio_network_service.dart'
    as _i25;
import 'package:hacker_news/data/data-sources/network/network_service.dart'
    as _i24;
import 'package:hacker_news/data/repositories/auth_repo_impl.dart' as _i27;
import 'package:hacker_news/data/repositories/language_repo_impl.dart' as _i14;
import 'package:hacker_news/data/repositories/news_repo.impl.dart' as _i29;
import 'package:hacker_news/data/repositories/post_repo_impl.dart' as _i7;
import 'package:hacker_news/data/repositories/theme_repo_impl.dart' as _i16;
import 'package:hacker_news/domain/auth/repository/auth_repo.dart' as _i26;
import 'package:hacker_news/domain/auth/use_cases/check_session_use_case.dart'
    as _i21;
import 'package:hacker_news/domain/auth/use_cases/login_use_case.dart' as _i33;
import 'package:hacker_news/domain/auth/use_cases/logout_use_case.dart' as _i20;
import 'package:hacker_news/domain/auth/use_cases/store_session_use_case.dart'
    as _i22;
import 'package:hacker_news/domain/auth/use_cases/verify_otp_use_case.dart'
    as _i34;
import 'package:hacker_news/domain/language/repositories/language_repo.dart'
    as _i13;
import 'package:hacker_news/domain/language/use_cases/get_available_languages_use_case.dart'
    as _i30;
import 'package:hacker_news/domain/language/use_cases/get_selected_language_use_case.dart'
    as _i32;
import 'package:hacker_news/domain/language/use_cases/set_languages_use_case.dart'
    as _i31;
import 'package:hacker_news/domain/news/repositories/news_repo.dart' as _i28;
import 'package:hacker_news/domain/news/use_cases/get_news_use_case.dart'
    as _i35;
import 'package:hacker_news/domain/posts/repository/post_repo.dart' as _i6;
import 'package:hacker_news/domain/posts/use_cases/fetch_posts_use_case.dart'
    as _i23;
import 'package:hacker_news/domain/theme/repository/theme_repo.dart' as _i15;
import 'package:hacker_news/domain/theme/use_cases/change_theme_use_case.dart'
    as _i18;
import 'package:hacker_news/domain/theme/use_cases/get_selected_theme_use_case.dart'
    as _i19;
import 'package:hacker_news/domain/theme/use_cases/get_themes_use_case.dart'
    as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i4.EnvModel>(
      () => appModule.loadEnvFile(),
      preResolve: true,
    );
    gh.singleton<_i5.Validations>(() => _i5.Validations());
    gh.factory<_i6.PostRepo>(() => _i7.PostRepoImpl());
    gh.singleton<_i8.TokenService>(() => _i8.TokenServiceImpl());
    await gh.singletonAsync<_i9.SecureStorageService>(
      () => _i9.SecureStorageServiceImpl.create(),
      preResolve: true,
    );
    await gh.singletonAsync<_i10.LocalStorageService>(
      () => _i10.SharedPreferenceStorage.create(),
      preResolve: true,
    );
    gh.singleton<_i11.WebViewService>(() => _i11.WebViewServiceImpl());
    await gh.factoryAsync<_i12.Dio>(
      () => appModule.loadDio(envModel: gh<_i4.EnvModel>()),
      preResolve: true,
    );
    gh.factory<_i13.LanguageRepo>(() => _i14.LanguageRepoImpl(
        localStorageService: gh<_i10.LocalStorageService>()));
    gh.factory<_i15.ThemeRepo>(() => _i16.ThemeRepoImpl(
        localStorageService: gh<_i10.LocalStorageService>()));
    gh.factory<_i17.GetThemeUseCase>(
        () => _i17.GetThemeUseCase(themeRepo: gh<_i15.ThemeRepo>()));
    gh.factory<_i18.ChangeThemeUseCase>(
        () => _i18.ChangeThemeUseCase(themeRepo: gh<_i15.ThemeRepo>()));
    gh.factory<_i19.GetSelectedThemeUseCase>(
        () => _i19.GetSelectedThemeUseCase(themeRepo: gh<_i15.ThemeRepo>()));
    gh.singleton<_i20.LogoutUseCase>(() => _i20.LogoutUseCase(
        localStorageService: gh<_i10.LocalStorageService>()));
    gh.singleton<_i21.CheckSessionUseCase>(() => _i21.CheckSessionUseCase(
        localStorageService: gh<_i10.LocalStorageService>()));
    gh.singleton<_i22.StoreSessionUseCase>(() => _i22.StoreSessionUseCase(
        localStorageService: gh<_i10.LocalStorageService>()));
    gh.singleton<_i23.FetchPostsUseCase>(
        () => _i23.FetchPostsUseCase(postRepo: gh<_i6.PostRepo>()));
    gh.singleton<_i24.NetworkService>(() => _i25.DioNetWorkService(
          client: gh<_i12.Dio>(),
          tokenRefreshService: gh<_i8.TokenService>(),
        ));
    gh.factory<_i26.AuthRepo>(
        () => _i27.AuthRepoImpl(networkService: gh<_i24.NetworkService>()));
    gh.factory<_i28.NewsRepo>(
        () => _i29.NewsRepoImpl(networkService: gh<_i24.NetworkService>()));
    gh.factory<_i30.GetAvailableLanguagesUseCase>(() =>
        _i30.GetAvailableLanguagesUseCase(
            languageRepo: gh<_i13.LanguageRepo>()));
    gh.factory<_i31.SetLanguageUseCase>(
        () => _i31.SetLanguageUseCase(languageRepo: gh<_i13.LanguageRepo>()));
    gh.factory<_i32.GetSelectedLanguageUseCase>(() =>
        _i32.GetSelectedLanguageUseCase(languageRepo: gh<_i13.LanguageRepo>()));
    gh.singleton<_i33.LoginUseCase>(
        () => _i33.LoginUseCase(authRepo: gh<_i26.AuthRepo>()));
    gh.singleton<_i34.VerifyOtpUseCase>(
        () => _i34.VerifyOtpUseCase(authRepo: gh<_i26.AuthRepo>()));
    gh.singleton<_i35.GetNewsUseCase>(
        () => _i35.GetNewsUseCase(newsRepo: gh<_i28.NewsRepo>()));
    return this;
  }
}

class _$AppModule extends _i36.AppModule {}
