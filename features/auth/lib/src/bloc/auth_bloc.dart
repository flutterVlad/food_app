import 'package:domain/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:navigation/navigation.dart';
import 'package:core/core.dart';

part 'auth_event.dart';

part 'auth_form_state.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final AppRouter _router;
  final CheckAuthenticationStatusUseCase _checkAuthenticationUseCase;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required AppRouter appRouter,
    required CheckAuthenticationStatusUseCase checkAuthenticationUseCase,
  })  : _signInUseCase = signInUseCase,
        _signInWithGoogleUseCase = signInWithGoogleUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _checkAuthenticationUseCase = checkAuthenticationUseCase,
        _router = appRouter,
        super(AuthState.init) {
    on<InitEvent>(_initAuth);
    on<SignInEvent>(_signIn);
    on<SignInWithGoogleEvent>(_signInWithGoogle);
    on<SignUpEvent>(_signUp);
    on<SignOutEvent>(_signOut);
    on<NavigateToHomePageEvent>(_navigateToHomePage);
    on<NavigateToSignUpEvent>(_navigateToSignUpPage);
    on<NavigateToSignInEvent>(_navigateToSignInPage);

    add(InitEvent());
  }

  Future<void> _initAuth(
    InitEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final UserModel userModel = await _checkAuthenticationUseCase.execute(
        const NoParams(),
      );

      if (userModel != UserModel.empty) {
        emit(
          state.copyWith(
            isLogged: true,
            userModel: userModel,
            authScreen: AuthScreen.home,
          ),
        );

        _router.replace(const EntryPointRoute());
      } else {
        emit(
          state.copyWith(
            authScreen: AuthScreen.signIn,
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formState: FailureFormState(
            error.message,
          ),
        ),
      );
    }
  }

  Future<void> _signIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final UserModel userModel = await _signInUseCase.execute(
        {
          'email': event.email,
          'password': event.password,
        },
      );
      emit(
        state.copyWith(
          isLogged: true,
          userModel: userModel,
          formState: SuccessFormState(),
          isLoading: false,
          authScreen: AuthScreen.home,
        ),
      );
      _router.replace(const EntryPointRoute());
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formState: FailureFormState(error.message),
        ),
      );
    }
  }

  Future<void> _signInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final UserModel userModel = await _signInWithGoogleUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          isLogged: true,
          formState: SuccessFormState(),
          userModel: userModel,
          authScreen: AuthScreen.home,
        ),
      );

      _router.replace(const EntryPointRoute());
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formState: FailureFormState(error.message),
        ),
      );
    }
  }

  Future<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final UserModel userModel = await _signUpUseCase.execute(
        {
          'email': event.email,
          'password': event.password,
          'userName': event.userName,
        },
      );
      emit(
        state.copyWith(
          isLogged: true,
          userModel: userModel,
          formState: SuccessFormState(),
          isLoading: false,
          authScreen: AuthScreen.home,
        ),
      );

      _router.replace(const EntryPointRoute());
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          formState: FailureFormState(error.message),
        ),
      );
    }
  }

  Future<void> _signOut(
    _,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        isLogged: false,
        formState: InitFormState(),
        userModel: UserModel.empty,
        authScreen: AuthScreen.signIn,
      ),
    );

    _router.replace(const StartAuthRoute());
  }

  void _navigateToHomePage(_, __) {
    _router.replace(const EntryPointRoute());
  }

  Future<void> _navigateToSignInPage(
    _,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authScreen: AuthScreen.signIn,
      ),
    );
  }

  Future<void> _navigateToSignUpPage(
    _,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authScreen: AuthScreen.signUp,
      ),
    );
  }
}
