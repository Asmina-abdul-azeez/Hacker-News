// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OtpVerificationState extends Equatable {

//<editor-fold desc="Data Methods">
  OtpVerificationState(
      {required this.otp,
      required this.otpError,
      required this.enableOtpVerificationButton,
      required this.otpVerified,});

  factory OtpVerificationState.init() {
    return OtpVerificationState(
        enableOtpVerificationButton: false,
        otp: null,
        otpError: null,
        otpVerified: false,);
  }
  String? otp = '';
  String? otpError;
  bool enableOtpVerificationButton = false;
  bool otpVerified;
  int otpFieldCount = 4;

  @override
  String toString() {
    return 'OtpVerificationState{otp: $otp, otpError: $otpError, '
        'enableOtpVerificationButton: $enableOtpVerificationButton,'
        ' otpVerified: $otpVerified, otpFieldCount: $otpFieldCount}';
  }

  OtpVerificationState copyWith(
      {String? otp,
      String? otpError,
      bool? enableOtpVerificationButton,
      bool? otpVerified,}) {
    return OtpVerificationState(
      otp: otp ?? this.otp,
      otpError: this.otpError,
      otpVerified: otpVerified ?? this.otpVerified,
      enableOtpVerificationButton:
          enableOtpVerificationButton ?? this.enableOtpVerificationButton,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [otp, otpError, enableOtpVerificationButton, otpVerified, otpFieldCount];

//</editor-fold>
}

class OtpVerificationSuccessStage extends OtpVerificationState {
  OtpVerificationSuccessStage(
      {required super.otp,
      required super.otpError,
      required super.enableOtpVerificationButton,
      required super.otpVerified,});
}
