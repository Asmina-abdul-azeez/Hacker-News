import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/app_utils/validations/validations.dart';
import 'package:hacker_news/app/di/injectable.dart';
import 'package:hacker_news/app/routes/router.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/app/widgets/app_screen.padding.dart';
import 'package:hacker_news/presentation/auth/auth_bloc.dart';
import 'package:hacker_news/presentation/otp_verification/otp_verification_bloc.dart';
import 'package:hacker_news/presentation/otp_verification/otp_verification_event.dart';
import 'package:hacker_news/presentation/otp_verification/otp_verification_state.dart';
import 'package:pinput/pinput.dart';

/// Represents the OTP verification page widget.
class OtpVerificationPage extends StatelessWidget {
  /// Constructor for OtpVerificationPage.
  const OtpVerificationPage({super.key});

  /// Builds the widget tree for the OTP verification page.
  @override
  Widget build(BuildContext context) {
    // Provide the OtpVerificationBloc to the widget tree.
    /// Access the AuthBloc from the context.
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocProvider(
      create: (BuildContext context) => OtpVerificationBloc(
          getIt.get<Validations>(),authBloc,)
        ..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  /// Builds the main content of the OTP verification page.
  Widget _buildPage(BuildContext context) {
    // Access the OtpVerificationBloc from the context.
    final bloc = BlocProvider.of<OtpVerificationBloc>(context);

    // Create the widget tree for the OTP verification page.
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        // Redirect to the parent route if OTP is verified.
        if (state.otpVerified) {
          router.go(Routes.appRoutes.parentRoute);
        }
      },
      listenWhen: (previous, current) =>
          previous.otpVerified != current.otpVerified,
      child: Scaffold(
        body: AppPadding(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pin input field for entering OTP.
            SizedBox(
              width: double.infinity,
              child: Pinput(
                onChanged: (String pin) {
                  bloc.add(OtpTypedEvent(pin));
                },
                onSubmitted: (String pin) {
                  bloc.add(OtpSubmittedEvent(pin));
                },
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
