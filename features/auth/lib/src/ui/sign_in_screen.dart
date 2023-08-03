import 'package:auth/src/bloc/auth_bloc.dart';
import 'package:auth/src/ui/auth_screen_template.dart';
import 'package:auth/src/widgets/sign_in_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return AuthTemplate(
      inputBloc: SignInInput(
        emailController: emailController,
        passwordController: passwordController,
      ),
      continueWithBloc: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: theme.secondaryHeaderColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(
                      fontSize: theme.textTheme.titleSmall!.fontSize,
                      color: theme.secondaryHeaderColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: theme.secondaryHeaderColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              authBloc.add(SignInWithGoogleEvent());
            },
            child: Center(
              child: Image.asset(
                'core_ui/assets/logo/google_logo.png',
                width: 65,
              ),
            ),
          ),
        ],
      ),
      navigateBloc: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Not a member?',
            style: TextStyle(
              fontSize: theme.textTheme.titleSmall!.fontSize,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              authBloc.add(NavigateToSignUpEvent());
            },
            child: Text(
              'Register now',
              style: TextStyle(
                color: theme.secondaryHeaderColor,
                fontSize: theme.textTheme.titleSmall!.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
