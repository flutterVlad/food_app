import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/users_repository.dart';
import 'package:domain/usecases/usecase.dart';

class SignInWithGoogleUseCase implements FutureUseCase<NoParams, UserModel> {
  final UserRepository _userRepository;

  SignInWithGoogleUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _userRepository.signInWithGoogle();
  }
}
