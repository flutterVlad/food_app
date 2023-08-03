import 'package:data/providers/preferences_provider.dart';
import 'package:domain/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesProvider _preferencesProvider;

  PreferencesRepositoryImpl({
    required PreferencesProvider preferencesProvider,
  }) : _preferencesProvider = preferencesProvider;

  @override
  bool isDarkTheme() {
    return _preferencesProvider.isDarkTheme();
  }

  @override
  void setTheme(bool isDark) {
    _preferencesProvider.setTheme(isDark);
  }

  @override
  String getFontSize() {
    return _preferencesProvider.getFontSize();
  }

  @override
  void setFontSize(String fontSize) {
    _preferencesProvider.setFontSize(fontSize);
  }
}
