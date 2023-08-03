import 'package:domain/repositories/preferences_repository.dart';
import 'usecase.dart';

class SetFontSizeUseCase implements FutureUseCase<String, void> {
  final PreferencesRepository _preferencesRepository;

  SetFontSizeUseCase({
    required PreferencesRepository preferencesRepository,
  }) : _preferencesRepository = preferencesRepository;

  @override
  Future<void> execute(String input) async {
    _preferencesRepository.setFontSize(input);
  }
}
