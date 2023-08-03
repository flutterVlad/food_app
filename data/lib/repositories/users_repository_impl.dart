import 'package:data/entity/user/user_entity.dart';
import 'package:data/mappers/user_mapper.dart';
import 'package:data/providers/auth_provider.dart';
import 'package:domain/repositories/users_repository.dart';
import 'package:domain/models/user/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthProvider _authProvider;

  UserRepositoryImpl({
    required AuthProvider authProvider,
  }) : _authProvider = authProvider;

  @override
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _authProvider.signUpWithEmailAndPassword(
      userName: userName,
      email: email,
      password: password,
    );

    return UserMapper.toModel(userEntity);
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity =
        await _authProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserMapper.toModel(userEntity);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final UserEntity userEntity = await _authProvider.signInWithGoogle();

    return UserMapper.toModel(userEntity);
  }

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
  }

  @override
  Future<UserModel> checkAuthentication() async {
    final UserEntity userEntity = await _authProvider.checkUserAuth();

    return UserMapper.toModel(userEntity);
  }
}
