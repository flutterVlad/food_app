import 'package:domain/repositories/users_repository.dart';
import 'package:domain/usecases/usecase.dart';

class SignOutUseCase implements FutureUseCase<NoParams, void> {
  final UserRepository _userRepository;

  SignOutUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(NoParams input) async {
    return _userRepository.signOut();
  }
}
