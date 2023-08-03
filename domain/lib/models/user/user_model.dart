class UserModel {
  final String userName;
  final String email;
  final String uid;

  UserModel({
    required this.userName,
    required this.email,
    required this.uid,
  });

  static UserModel get empty => UserModel(
        userName: '',
        email: '',
        uid: '',
      );

  bool isEmpty() => this == UserModel.empty;

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        uid == other.uid &&
        userName == other.userName &&
        email == other.email;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      uid,
      userName,
      email,
    );
  }

}
