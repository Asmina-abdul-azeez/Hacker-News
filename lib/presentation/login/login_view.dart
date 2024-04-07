import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/app/app_utils/validations/validations.dart';
import 'package:hacker_news/app/config/app_screen_config.dart';
import 'package:hacker_news/app/routes/router.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/app/widgets/app_button.dart';
import 'package:hacker_news/app/widgets/base_view.dart';
import 'package:hacker_news/app/widgets/sized_boxes.dart';
import 'package:hacker_news/presentation/auth/auth_bloc.dart';
import 'package:hacker_news/presentation/login/login_bloc.dart';
import 'package:hacker_news/presentation/login/login_event.dart';
import 'package:hacker_news/presentation/login/login_state.dart';
import 'package:hacker_news/presentation/shared_widgets.dart';

/// Represents the login page widget.
class LoginPage extends StatelessWidget {
  /// Constructor for LoginPage.
  const LoginPage({super.key});

  /// Builds the widget tree for the login page.
  @override
  Widget build(BuildContext context) {
    /// Access the AuthBloc from the context.
    final authBloc = BlocProvider.of<AuthBloc>(context);

    /// Provide the LoginBloc to the widget tree.
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(
          Validations(),
          authBloc,)
        ..add(InitEvent()),
      child: Builder(builder: _buildPage),
    );
  }

  /// Builds the main content of the login page.
  Widget _buildPage(BuildContext context) {
    // Access the LoginBloc from the context.
    final bloc = BlocProvider.of<LoginBloc>(context);

    // Create the widget tree for the login page.
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // Redirect to OTP verification page if OTP is sent.
        if (state.resource.isSuccess) {
          router.go(Routes.authRoutes.verifyOtpRoute);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppScreenConfig.defaultScreenPadding),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return BaseView<bool>(
                resource: state.resource,
                onErrorBuilder: (error, errorMessage) {
                  // Show the login view with error message.
                  return buildLoginView(context,state, bloc);
                },
                onLoadingBuilder: () {
                  // Show the login view with loading indicator.
                  return buildLoginView( context,state, bloc, showButtonLoader:
                  true,);
                },
                onInitialBuilder: () {
                  // Show the initial state of the login view.
                  return buildLoginView(context,state, bloc);
                },
                onSuccess: (bool c) {
                  // Show the success state of the login view.
                  return buildLoginView(context,state, bloc);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  /// Build the login view with text field and login button.
  Column buildLoginView(BuildContext context,LoginState state, LoginBloc bloc,
      {bool showButtonLoader = false,}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        // Text field for entering phone number.
        AppTextField(
            error: state.phoneNumberError,
            textInputType: TextInputType.phone,
            onChanged: (v) {
              bloc.add(PhoneNumberTypedEvent(v));
            },),
        verticalBox5,
        // Button for initiating the login process.
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppScreenConfig.defaultInnerPadding,),
          child: AppButton(
            loading: showButtonLoader,
            enabled: state.enableSubmitButton,
            onPressed: () {
              bloc.add(LoginButtonPressedEvent());
            },
            label: 'Login',
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class Cm {

  const Cm();
  static const double itemSize = 10;
}
