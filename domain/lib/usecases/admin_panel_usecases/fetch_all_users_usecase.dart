import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllUsersUseCase extends FutureUseCase<NoParams, List<UserModel>> {
  final UserRepository _userRepository;

  FetchAllUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<UserModel>> execute(NoParams input) async {
    return _userRepository.fetchAllUsers();
  }
}
