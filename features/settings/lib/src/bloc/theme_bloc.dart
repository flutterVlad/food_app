import 'package:domain/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/export_usecases.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SetThemeDataUseCase _setThemeDataUseCase;
  final CheckThemeDataUseCase _checkThemeDataUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;
  final GetFontSizeUseCase _getFontSizeUseCase;

  ThemeBloc({
    required SetThemeDataUseCase setThemeDataUseCase,
    required CheckThemeDataUseCase checkThemeDataUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
    required GetFontSizeUseCase getFontSizeUseCase,
  })
      : _setThemeDataUseCase = setThemeDataUseCase,
        _checkThemeDataUseCase = checkThemeDataUseCase,
        _setFontSizeUseCase = setFontSizeUseCase,
        _getFontSizeUseCase = getFontSizeUseCase,
        super(
        ThemeState(
          sizeData: 'medium',
          appTheme: AppTheme.getDarkThemeData('medium'),
          gradient: AppDarkThemeColors.gradient,
          switchState: false,
        ),
      ) {
    on<InitialAllThemeSettingsEvent>(_initAllSettings);
    on<ThemeSwitchEvent>(_switchTheme);
    on<SizeSwitchEvent>(_switchFontSize);
  }

  void _initAllSettings(InitialAllThemeSettingsEvent event,
      Emitter<ThemeState> emit,) async {
    _initFontSize();
    _initTheme();
  }

  Future<void> _initTheme() async {
    final bool hasDarkTheme =
    await _checkThemeDataUseCase.execute(const NoParams());
    if (hasDarkTheme) {
      emit(
        state.copyWith(
          appTheme: AppTheme.getDarkThemeData(state.sizeData),
          gradient: AppDarkThemeColors.gradient,
          switchState: !hasDarkTheme,
        ),
      );
    } else {
      emit(
        state.copyWith(
          appTheme: AppTheme.getLightThemeData(state.sizeData),
          gradient: AppLightThemeColors.gradient,
          switchState: hasDarkTheme,
        ),
      );
    }
  }

  Future<void> _switchTheme(ThemeSwitchEvent event,
      Emitter<ThemeState> emit,) async {
    final bool isDark = !state.switchState;
    emit(
      isDark
          ? state.copyWith(
        appTheme: AppTheme.getLightThemeData(state.sizeData),
        gradient: AppLightThemeColors.gradient,
        switchState: true,
      )
          : state.copyWith(
        appTheme: AppTheme.getDarkThemeData(state.sizeData),
        gradient: AppDarkThemeColors.gradient,
        switchState: false,
      ),
    );
    await _setThemeDataUseCase.execute(isDark);
  }

  Future<void> _switchFontSize(SizeSwitchEvent event,
      Emitter<ThemeState> emit,) async {
    emit(
      state.copyWith(
        sizeData: event.sizeData,
        appTheme: state.updateThemeFontSize(event.sizeData),
      ),
    );
    await _setFontSizeUseCase.execute(event.sizeData);
  }

  Future<void> _initFontSize() async {
    final String fontSize = await _getFontSizeUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        sizeData: fontSize,
      )
    );
  }
}
