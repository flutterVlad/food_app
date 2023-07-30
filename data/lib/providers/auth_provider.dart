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
        await getUserFromDatabase(uid: credential.user!.uid);

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

    await saveUserInDatabase(
      uid: userCredential.user!.uid,
      userName: userCredential.user!.displayName ?? '',
      email: userCredential.user!.email ?? '',
    );

    final UserEntity userEntity = UserEntity(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email ?? '',
      userName: userCredential.user!.displayName ?? '',
    );

    return userEntity;
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

  Future<UserEntity> getUserFromDatabase({required String uid}) async {
    final DataSnapshot snapshot = await _database.ref('users').child(uid).get();
    print(snapshot.value);
    if (snapshot.exists) {
      final Map<dynamic, dynamic> userData =
          snapshot.value as Map<dynamic, dynamic>;
      return UserEntity(
        uid: uid,
        email: userData['email'],
        userName: userData['userName'],
      );
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
