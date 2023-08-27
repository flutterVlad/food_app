import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';
import '../../auth.dart';

class AuthTemplate extends StatefulWidget {
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
  State<AuthTemplate> createState() => _AuthTemplateState();
}

class _AuthTemplateState extends State<AuthTemplate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        _controller.forward();
        if (state.isLoading) {
          return const AppCenterLoader();
        } else if (!state.isLogged) {
          return SingleChildScrollView(
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
                  FadeTransition(
                    opacity: _animation,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 50),
                        widget.inputBloc,
                        const SizedBox(height: 30),
                        widget.continueWithBloc ?? Container(),
                        const SizedBox(height: 50),
                        widget.navigateBloc,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const AppCenterLoader();
        }
      },
    );
  }
}
