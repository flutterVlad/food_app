part of 'auth_bloc.dart';

class AuthState {
  final bool isLoaded;
  final UserModel userModel;
  final FormState formState;
  final bool isLoading;
  final AuthScreen authScreen;

  AuthState({
    required this.isLoaded,
    required this.userModel,
    required this.formState,
    required this.isLoading,
    required this.authScreen,
  });

  AuthState copyWith({
    bool? isLoaded,
    UserModel? userModel,
    FormState? formState,
    bool? isLoading,
    AuthScreen? authScreen,
  }) =>
      AuthState(
        isLoaded: isLoaded ?? this.isLoaded,
        userModel: userModel ?? this.userModel,
        formState: formState ?? this.formState,
        isLoading: isLoading ?? this.isLoading,
        authScreen: authScreen ?? this.authScreen,
      );

  static AuthState get init => AuthState(
        isLoaded: false,
        userModel: UserModel.empty,
        formState: InitFormState(),
        isLoading: false,
        authScreen: AuthScreen.home,
      );
}
