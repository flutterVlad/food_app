import 'package:domain/repositories/users_repository.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:domain/models/user/user_model.dart';

class CheckAuthenticationStatusUseCase extends FutureUseCase<NoParams, UserModel> {
  final UserRepository _userRepository;

  CheckAuthenticationStatusUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _userRepository.checkAuthentication();
  }
}
