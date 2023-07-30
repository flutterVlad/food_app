import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/src/bloc/auth_bloc.dart';
import 'app_text_field.dart';
import 'sign_button.dart';

class SignInInput extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInInput({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppTextField(
          controller: emailController,
          hintText: 'Email',
          obscureText: false,
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 15),
        SignButton(
          text: 'Sign In',
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(
              SignInEvent(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}
