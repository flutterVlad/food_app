part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;

  SignUpEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class NavigateToHomePageEvent extends AuthEvent {}

class NavigateToSignUpEvent extends AuthEvent {}

class NavigateToSignInEvent extends AuthEvent {}
