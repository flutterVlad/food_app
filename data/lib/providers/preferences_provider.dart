import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  final SharedPreferences _preferences;

  PreferencesProvider({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  bool isDarkTheme() {
    return _preferences.getBool('is_dark') ?? false;
  }

  void setTheme(bool isDark) {
    _preferences.setBool('is_dark', !isDark);
  }
}
