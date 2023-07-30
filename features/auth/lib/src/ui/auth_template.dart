import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';
import '../../auth.dart';

class AuthTemplate extends StatelessWidget {
  final Widget inputBloc;
  final Widget? continueWithBloc;
  final Widget navigateBloc;

  const AuthTemplate({
    super.key,
    required this.inputBloc,
    required this.navigateBloc,
    this.continueWithBloc,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state.formState is FailureFormState) {
          FlushBar.showFlushBar(
            context: context,
            icon: Icons.error,
            message: state.formState.toString(),
            gradient: ThemeState.errorGradient,
            textColor: Colors.white,
          );
        }
      },
      builder: (BuildContext context, AuthState state) {
        if (!state.isLogged) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    GradientBlock(
                      gradient: themeState.gradient,
                      child: Image.asset(
                        'core_ui/assets/logo/logo_white_trans.png',
                        width: 300,
                      ),
                    ),
                    const SizedBox(height: 50),
                    inputBloc,
                    const SizedBox(height: 30),
                    continueWithBloc ?? Container(),
                    const SizedBox(height: 50),
                    navigateBloc,
                  ],
                ),
              ),
            ),
          );
        }
        else {
          return const AppCenterLoader();
        }
      },
    );
  }
}
