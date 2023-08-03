import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class StartAuthScreen extends StatelessWidget {
  const StartAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isLogged) {
            authBloc.add(NavigateToHomePageEvent());
          }
        },
        builder: (BuildContext context, AuthState state) {
          if (state.authScreen == AuthScreen.signIn) {
            return SignInScreen();
          }
          else if (state.authScreen == AuthScreen.signUp) {
            return SignUpScreen();
          }
          else {
            return const AppCenterLoader();
          }
        }
      ),
    );
  }
}
