class UserEntity {
  final String uid;
  final String email;
  final String userName;

  UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
  });

  factory UserEntity.fromJson(Map<dynamic, dynamic> json) {
    return UserEntity(
      uid: json['uid'],
      email: json['email'],
      userName: json['userName'],
    );
  }

  static UserEntity get empty => UserEntity(
        uid: '',
        email: '',
        userName: '',
      );

  Map<String, String> toMap() => <String, String>{
        'uid': uid,
        'email': email,
        'userName': userName,
      };
}
