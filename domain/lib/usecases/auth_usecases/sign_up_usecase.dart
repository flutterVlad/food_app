import 'package:domain/models/user/user_model.dart';
import 'package:domain/repositories/users_repository.dart';
import 'package:domain/usecases/usecase.dart';

class SignUpUseCase implements FutureUseCase<Map<String, String>, UserModel> {
  final UserRepository _userRepository;

  SignUpUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(Map<String, String> userParams) async {
    return _userRepository.signUp(
      userName: userParams['userName']!,
      email: userParams['email']!,
      password: userParams['password']!,
    );
  }
}
