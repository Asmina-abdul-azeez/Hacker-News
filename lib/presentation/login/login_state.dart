import 'package:hacker_news/app/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part '../../gen/login/login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool enableSubmitButton,
    String? phoneNumberError,
    bool? submitPressed,
    String? phoneNumber,
    @Default(ResourceInitial())  Resource<bool> resource,
  }) = _LoginState;

  factory LoginState.init() {
    return const LoginState(submitPressed: false, enableSubmitButton: false);
  }
}
