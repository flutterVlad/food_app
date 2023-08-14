class UserEntity {
  final String uid;
  final String email;
  final String userName;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
  });

  factory UserEntity.fromJson(Map<dynamic, dynamic> json) => UserEntity(
        uid: json['uid'],
        email: json['email'],
        userName: json['userName'],
      );

  static UserEntity get empty {
    return UserEntity(
      uid: '',
      email: '',
      userName: '',
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'uid': uid,
      'email': email,
      'userName': userName,
    };
  }
}
