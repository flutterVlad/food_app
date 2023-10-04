class UserModel {
  final String userName;
  final String email;
  final String uid;
  final String role;

  const UserModel({
    required this.userName,
    required this.email,
    required this.uid,
    required this.role,
  });

  static UserModel get empty {
    return const UserModel(
      userName: '',
      email: '',
      uid: '',
      role: '',
    );
  }

  UserModel copyWith({
    String? userName,
    String? email,
    String? uid,
    String? role,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      role: role ?? this.role,
    );
  }

  bool isEmpty() => this == UserModel.empty;

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        uid == other.uid &&
        userName == other.userName &&
        email == other.email &&
        role == other.role;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      uid,
      userName,
      email,
      role,
    );
  }
}
