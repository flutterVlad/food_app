import 'package:data/entity/user/user_entity.dart';
import 'package:domain/models/user/user_model.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      uid: model.uid,
      email: model.email,
      userName: model.userName,
      role: model.role,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      userName: entity.userName,
      email: entity.email,
      uid: entity.uid,
      role: entity.role,
    );
  }
}
