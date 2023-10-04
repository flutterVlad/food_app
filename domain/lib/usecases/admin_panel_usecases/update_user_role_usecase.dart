import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class UpdateUserRoleUseCase extends FutureUseCase<UserModel, void> {
  final UserRepository _userRepository;

  UpdateUserRoleUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(UserModel input) async {
    await _userRepository.updateUserRole(userModel: input);
  }
}
