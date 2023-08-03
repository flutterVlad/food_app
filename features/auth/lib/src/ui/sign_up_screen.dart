import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/src/bloc/auth_bloc.dart';
import 'package:auth/src/ui/auth_screen_template.dart';
import 'package:auth/src/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return AuthTemplate(
      inputBloc: SignUpInput(
        userNameController: userNameController,
        passwordController: passwordController,
        emailController: emailController,
      ),
      navigateBloc: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: theme.textTheme.titleSmall!.fontSize,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              authBloc.add(NavigateToSignInEvent());
            },
            child: Text(
              'Sign in now',
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
