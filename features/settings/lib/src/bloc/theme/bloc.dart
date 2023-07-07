import 'package:domain/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/export_usecases.dart';

part 'event.dart';

part 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SetThemeDataUseCase _setThemeDataUseCase;
  final CheckThemeDataUseCase _checkThemeDataUseCase;

  ThemeBloc({
    required SetThemeDataUseCase setThemeDataUseCase,
    required CheckThemeDataUseCase checkThemeDataUseCase,
  })  : _setThemeDataUseCase = setThemeDataUseCase,
        _checkThemeDataUseCase = checkThemeDataUseCase,
        super(DarkThemeState()) {
    on<InitialThemeSetEvent>(_init);
    on<ThemeSwitchEvent>(_switchTheme);
  }

  Future<void> _init(InitialThemeSetEvent event, Emitter emit) async {
    final bool hasDarkTheme =
        await _checkThemeDataUseCase.execute(const NoParams());
    if (hasDarkTheme) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void _switchTheme(ThemeSwitchEvent event, Emitter emit) {
    final bool isDark = state is DarkThemeState;
    emit(isDark ? LightThemeState() : DarkThemeState());
    _setThemeDataUseCase.execute(isDark);
  }
}
