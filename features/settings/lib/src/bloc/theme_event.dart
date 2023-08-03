part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class InitialAllThemeSettingsEvent extends ThemeEvent {}

class ThemeSwitchEvent extends ThemeEvent {}

class SizeSwitchEvent extends ThemeEvent {
  final String sizeData;

  SizeSwitchEvent({required this.sizeData});
}
