abstract class LoginEvent {}

class InitEvent extends LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {}

class PhoneNumberTypedEvent extends LoginEvent {

  PhoneNumberTypedEvent(this.phoneNumber);
  String? phoneNumber;
}
