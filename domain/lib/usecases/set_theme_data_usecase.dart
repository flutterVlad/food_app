import 'package:domain/repositories/preferences_repository.dart';
import 'usecase.dart';

class SetThemeDataUseCase implements FutureUseCase<bool, void> {
  final PreferencesRepository _preferencesRepository;

  SetThemeDataUseCase({
    required PreferencesRepository preferencesRepository,
  }) : _preferencesRepository = preferencesRepository;

  @override
  Future<void> execute(bool input) async {
    _preferencesRepository.setTheme(input);
  }
}
