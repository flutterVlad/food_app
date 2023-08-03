part of 'auth_bloc.dart';

class AuthState {
  final bool isLogged;
  final UserModel userModel;
  final FormState formState;
  final bool isLoading;
  final AuthScreen authScreen;

  AuthState({
    required this.isLogged,
    required this.userModel,
    required this.formState,
    required this.isLoading,
    required this.authScreen,
  });

  AuthState copyWith({
    bool? isLogged,
    UserModel? userModel,
    FormState? formState,
    bool? isLoading,
    AuthScreen? authScreen,
  }) =>
      AuthState(
        isLogged: isLogged ?? this.isLogged,
        userModel: userModel ?? this.userModel,
        formState: formState ?? this.formState,
        isLoading: isLoading ?? this.isLoading,
        authScreen: authScreen ?? this.authScreen,
      );

  static AuthState get init => AuthState(
        isLogged: false,
        userModel: UserModel.empty,
        formState: InitFormState(),
        isLoading: false,
        authScreen: AuthScreen.home,
      );
}
