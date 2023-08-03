import 'package:data/entity/user/user_entity.dart';
import 'package:domain/models/user/user_model.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) => UserEntity(
        uid: model.uid,
        email: model.email,
        userName: model.userName,
      );

  static UserModel toModel(UserEntity entity) => UserModel(
        userName: entity.userName,
        email: entity.email,
        uid: entity.uid,
      );
}
