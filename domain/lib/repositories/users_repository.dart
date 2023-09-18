import 'package:domain/models/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<UserModel> signInWithGoogle();

  Future<UserModel> checkAuthentication();

  Future<List<UserModel>> fetchAllUsers();

  Future<void> updateUserRole({
    required UserModel userModel,
  });
}
