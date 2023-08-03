import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/auth.dart';
import 'sign_button.dart';
import 'app_text_field.dart';

class SignUpInput extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpInput({
    super.key,
    required this.userNameController,
    required this.passwordController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppTextField(
          controller: userNameController,
          hintText: 'Name',
          obscureText: false,
        ),
        const SizedBox(height: 10),
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
          text: 'Sign Up',
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(
              SignUpEvent(
                userName: userNameController.text,
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
