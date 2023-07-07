part of 'bloc.dart';

abstract class ThemeState {
  late final ThemeData appTheme;
  late final LinearGradient gradient;
  static const Map<String, String> appBarTitle = {
    'HomeRoute': 'Products',
    'OrderHistoryRoute': 'Order History',
    'CartRoute': 'Your Cart',
    'SettingsRoute': 'Settings',
    'ProductDetailRoute': 'Details'
  };
}

class DarkThemeState implements ThemeState {
  @override
  ThemeData appTheme = AppTheme.getDarkThemeData();
  @override
  LinearGradient gradient = AppDarkThemeColors.gradient;
}

class LightThemeState implements ThemeState {
  @override
  ThemeData appTheme = AppTheme.getLightThemeData();
  @override
  LinearGradient gradient = AppLightThemeColors.gradient;
}
