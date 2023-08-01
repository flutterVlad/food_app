part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final UserModel userModel;
  final FormState formState;
  final bool isLoading;

  AuthState({
    required this.isLogged,
    required this.userModel,
    required this.formState,
    required this.isLoading,
  });

  AuthState copyWith(
          {bool? isLogged,
          UserModel? userModel,
          FormState? formState,
          bool? isLoading}) =>
      AuthState(
        isLogged: isLogged ?? this.isLogged,
        userModel: userModel ?? this.userModel,
        formState: formState ?? this.formState,
        isLoading: isLoading ?? this.isLoading,
      );

  static AuthState get init => AuthState(
        isLogged: false,
        userModel: UserModel.empty,
        formState: InitFormState(),
        isLoading: false,
      );
}
