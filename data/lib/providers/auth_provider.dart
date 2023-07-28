import 'package:data/entity/user/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final FirebaseDatabase _database;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required FirebaseDatabase database,
  })  : _firebaseAuth = firebaseAuth,
        _database = database;

  Future<UserEntity> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final UserEntity userEntity = UserEntity(
      uid: credential.user!.uid,
      email: email,
      userName: userName,
    );

    await saveUserInDatabase(
      uid: credential.user!.uid,
      userName: userName,
      email: email,
    );

    return userEntity;
  }

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final UserEntity userEntity =
        await getUserForDatabase(uid: credential.user!.uid);

    return userEntity;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> saveUserInDatabase({
    required String uid,
    required String userName,
    required String email,
  }) async {
    final DatabaseReference databaseReference = _database.ref('users');
    final Map<String, String> userData = {
      'uid': uid,
      'userName': userName,
      'email': email,
    };

    await databaseReference.child(uid).set(userData);
  }

  Future<UserEntity> getUserForDatabase({required String uid}) async {
    final DataSnapshot snapshot = await _database.ref('users').child(uid).get();
    if (snapshot.exists) {
      final Map<String, dynamic> userData =
          snapshot.value as Map<String, dynamic>;
      return UserEntity(
        uid: uid,
        email: userData['email'],
        userName: userData['userName'],
      );
    } else {
      return UserEntity.empty;
    }
  }
}
