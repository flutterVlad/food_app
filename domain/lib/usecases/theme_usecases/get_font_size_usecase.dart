import 'package:domain/repositories/preferences_repository.dart';
import '../usecase.dart';

class GetFontSizeUseCase implements FutureUseCase<NoParams, String> {
  final PreferencesRepository _preferencesRepository;

  GetFontSizeUseCase({
    required PreferencesRepository preferencesRepository,
  }) : _preferencesRepository = preferencesRepository;

  @override
  Future<String> execute(NoParams input) async {
    return _preferencesRepository.getFontSize();
  }
}
