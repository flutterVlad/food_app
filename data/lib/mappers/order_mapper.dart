import 'package:data/entity/order/order_entity.dart';
import 'package:data/mappers/cart_mapper.dart';
import 'package:domain/models/order/order_model.dart';

abstract class OrderMapper {
  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      cart: CartMapper.toModel(entity.cart),
      dateTime: entity.dateTime,
    );
  }

  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      cart: CartMapper.toEntity(model.cart),
      dateTime: model.dateTime,
    );
  }
}
