abstract class OtpVerificationEvent {}

class InitEvent extends OtpVerificationEvent {}

class OtpTypedEvent extends OtpVerificationEvent {

  OtpTypedEvent(this.otp);
  String? otp;
}
class OtpSubmittedEvent extends OtpVerificationEvent {

  OtpSubmittedEvent(this.otp);
  String? otp;
}

class OtpVerificationButtonPressedEvent extends OtpVerificationEvent {}
