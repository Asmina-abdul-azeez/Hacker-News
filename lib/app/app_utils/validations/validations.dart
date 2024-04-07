import 'package:injectable/injectable.dart';

@Singleton()
class Validations {
  String? emailValid(String email) => RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
          .hasMatch(email)
      ? email.trim() == ''
          ? 'Enter email'
          : null
      : 'Enter a valid email';

  String? passwordValid(String password) =>
      password.length > 8 ? null : 'Password should have a minimum length of 8';

  String? phoneNumberValid(String? phoneNumber) =>
      (phoneNumber ?? '').length >= 10
          ? null
          : 'Phone number should have a '
              'minimum '
              'length of 10';

  String? otpValid(String? otp) =>
      (otp ?? '').length >= 6 ? null : 'OTP should have a minimum length of 6';
}
