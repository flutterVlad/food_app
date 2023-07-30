part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final UserModel userModel;
  final FormState formState;

  AuthState({
    required this.isLogged,
    required this.userModel,
    required this.formState,
  });

  AuthState copyWith({
    bool? isLogged,
    UserModel? userModel,
    FormState? formState,
  }) =>
      AuthState(
        isLogged: isLogged ?? this.isLogged,
        userModel: userModel ?? this.userModel,
        formState: formState ?? this.formState,
      );

  static AuthState get init => AuthState(
        isLogged: false,
        userModel: UserModel.empty,
        formState: InitFormState(),
      );
}
