import 'package:bloc/bloc.dart';
import 'package:hacker_news/app/app_utils/validations/validations.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/presentation/auth/auth_bloc.dart';
import 'package:hacker_news/presentation/login/login_event.dart';
import 'package:hacker_news/presentation/login/login_state.dart';

/// Define a BLoC for handling
/// login-related events and states
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  /// Authentication BLoC for
  /// handling user authentication state

  /// Constructor to initialize the BLoC with dependencies and initial state
  LoginBloc(this._validations, this.authBloc)
      : super(LoginState.init()) {
    on<InitEvent>(_init);

    /// Define behavior for initialization event
    on<LoginEvent>(handleEvent);

    /// Define behavior for login event
  }
  final Validations _validations;

  /// Validation helper class

  /// Use case for handling login
  final AuthBloc authBloc;

  /// Method to handle initialization event
  Future<void> _init(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith());

    /// Emit a copy of the current state
  }

  /// Method to handle various login-related events
  void handleEvent(LoginEvent event, Emitter<LoginState> emit) {
    if (event is LoginButtonPressedEvent) {
      _submit();

      /// Handle login button pressed event
    }
    if (event is PhoneNumberTypedEvent) {
      _validatePhoneNumber(event.phoneNumber ?? '');

      /// Handle phone number typed event
    }
  }

  /// Method to validate the entered phone number
void  _validatePhoneNumber(String phoneNumber) {
    final phoneError = _validations.phoneNumberValid(phoneNumber);
    emit(state.copyWith(
        phoneNumberError: phoneError,
        enableSubmitButton: phoneError == null,
        phoneNumber: phoneNumber,),);
  }

  /// Method to submit the login credentials
  Future<void> _submit() async {
    _validatePhoneNumber(state.phoneNumber ?? '');
    if (state.phoneNumberError == null) {
      emit(state.copyWith(resource: Resource.loading()));

      /// Update state to indicate loading
     final response= await authBloc.generateOtp(state.phoneNumber ?? '');
      emit(state.copyWith(
          resource: response,),);
    }
  }
}
