part of 'theme_bloc.dart';

class ThemeState {
  final bool switchState;
  final String sizeData;
  final ThemeData appTheme;
  final LinearGradient gradient;
  static const Map<String, double> cardSize = {
    'little' : 0.74,
    'medium': 0.72,
    'large': 0.69,
  };
  static LinearGradient errorGradient = AppGradients.errorGradient;
  static LinearGradient successGradient = AppGradients.successGradient;

  ThemeState({
    required this.sizeData,
    required this.appTheme,
    required this.gradient,
    required this.switchState,
  });

  ThemeState copyWith({
    String? sizeData,
    ThemeData? appTheme,
    LinearGradient? gradient,
    bool? switchState,
  }) {
    return ThemeState(
      sizeData: sizeData ?? this.sizeData,
      appTheme: appTheme ?? this.appTheme,
      gradient: gradient ?? this.gradient,
      switchState: switchState ?? this.switchState,
    );
  }

  ThemeData updateThemeFontSize(String sizeData) {
    return switchState
        ? AppTheme.getLightThemeData(sizeData)
        : AppTheme.getDarkThemeData(sizeData);
  }
}
