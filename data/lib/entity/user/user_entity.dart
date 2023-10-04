class UserEntity {
  final String uid;
  final String email;
  final String userName;
  final String role;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
    required this.role,
  });

  factory UserEntity.fromJson(Map<dynamic, dynamic> json) => UserEntity(
        uid: json['uid'],
        email: json['email'],
        userName: json['userName'],
        role: json['role'],
      );

  static UserEntity get empty {
    return UserEntity(
      uid: '',
      email: '',
      userName: '',
      role: '',
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'uid': uid,
      'email': email,
      'userName': userName,
      'role': role,
    };
  }
}
