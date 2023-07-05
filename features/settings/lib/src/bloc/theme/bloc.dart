import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_ui/core_ui.dart';

part 'event.dart';
part 'theme_helper.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.getDarkThemeData()) {
    on<InitialThemeSetEvent>(_init);
    on<ThemeSwitchEvent>(_switchTheme);
  }

  void _init(InitialThemeSetEvent event, Emitter emit) async {
    final bool hasDarkTheme = await isDark();
    if (hasDarkTheme) {
      emit(AppTheme.getDarkThemeData());
    } else {
      emit(AppTheme.getLightThemeData());
    }
  }

  void _switchTheme(ThemeSwitchEvent event, Emitter emit) {
    final isDark = state == AppTheme.getDarkThemeData();
    emit(isDark ? AppTheme.getLightThemeData() : AppTheme.getDarkThemeData());
    setTheme(isDark);
  }

}
