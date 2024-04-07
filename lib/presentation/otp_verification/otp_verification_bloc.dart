import 'package:bloc/bloc.dart';
import 'package:hacker_news/app/app_utils/validations/validations.dart';
import 'package:hacker_news/presentation/auth/auth_bloc.dart';

import 'package:hacker_news/presentation/otp_verification/otp_verification_event.dart';
import 'package:hacker_news/presentation/otp_verification/otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {

  OtpVerificationBloc(this._validations, this._authBloc)
      : super(OtpVerificationState.init()) {
    on<OtpVerificationEvent>(handleEvent);
  }
  final Validations _validations;
  final AuthBloc _authBloc;

  void handleEvent(
      OtpVerificationEvent event, Emitter<OtpVerificationState> emit,) {
    if (event is OtpSubmittedEvent) {
      _verifyOtp(event.otp??'');
    } else if (event is OtpTypedEvent) {
      emit(state.copyWith(otpError: _validations.otpValid(event.otp ?? '')));
      if (event.otp?.length == state.otpFieldCount) {
        _verifyOtp(event.otp??'');
      }
    }
  }

  Future<void> _verifyOtp(String otp) async {
    final response = await _authBloc.verifyOtp(otp);
  }
}
