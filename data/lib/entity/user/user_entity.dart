class UserEntity {
  final String uid;
  final String email;
  final String userName;

  UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
  });

  static UserEntity get empty => UserEntity(
        uid: '',
        email: '',
        userName: '',
      );
}
