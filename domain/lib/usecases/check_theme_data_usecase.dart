import 'package:domain/repositories/preferences_repository.dart';
import 'usecase.dart';

class CheckThemeDataUseCase implements FutureUseCase<NoParams, bool> {
  final PreferencesRepository _preferencesRepository;

  CheckThemeDataUseCase({
    required PreferencesRepository preferencesRepository,
  }) : _preferencesRepository = preferencesRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _preferencesRepository.isDarkTheme();
  }
}
