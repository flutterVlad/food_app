import 'package:data/entity/user/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;
  final FirebaseDatabase _database;
  final GoogleSignIn _googleSignIn;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required FirebaseDatabase database,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _database = database,
        _googleSignIn = googleSignIn;

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
      uid: credential.user?.uid ?? '',
      email: email,
      userName: userName,
    );

    await saveUserInDatabase(
      userEntity: userEntity,
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
        await getUserFromDatabase(uid: credential.user?.uid ?? '');

    return userEntity;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future<UserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    final UserEntity userEntity = UserEntity(
      uid: userCredential.user?.uid ?? '',
      email: userCredential.user?.email ?? '',
      userName: userCredential.user?.displayName ?? '',
    );

    await saveUserInDatabase(
      userEntity: userEntity,
    );

    return userEntity;
  }

  Future<void> saveUserInDatabase({
    required UserEntity userEntity,
  }) async {
    final DatabaseReference databaseReference = _database.ref('users');

    await databaseReference.child(userEntity.uid).set(userEntity.toMap());
  }

  Future<UserEntity> getUserFromDatabase({
    required String uid,
  }) async {
    final DataSnapshot snapshot = await _database.ref('users').child(uid).get();
    if (snapshot.exists) {
      return UserEntity.fromJson(snapshot.value as Map<dynamic, dynamic>);
    } else {
      return UserEntity.empty;
    }
  }

  Future<UserEntity> checkUserAuth() async {
    final User? authUser = _firebaseAuth.currentUser;

    if (authUser != null) {
      final UserEntity userEntity = await getUserFromDatabase(
        uid: authUser.uid,
      );

      return userEntity;
    } else {
      return UserEntity.empty;
    }
  }
}
