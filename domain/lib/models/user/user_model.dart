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
}
