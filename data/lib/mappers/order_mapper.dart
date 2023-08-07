import 'package:data/entity/order/order_entity.dart';
import 'package:data/mappers/cart_mapper.dart';
import 'package:domain/models/order/order_model.dart';

abstract class OrderMapper {
  static OrderModel toModel(OrderEntity entity) => OrderModel(
        id: entity.id,
        cart: CartMapper.toModel(entity.cart),
        dateTime: entity.dateTime,
      );

  static OrderEntity toEntity(OrderModel model) => OrderEntity(
        id: model.id,
        cart: CartMapper.toEntity(model.cart),
        dateTime: model.dateTime,
      );
}
