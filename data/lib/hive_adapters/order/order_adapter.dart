import 'package:data/entity/cart/cart_entity.dart';
import 'package:hive/hive.dart';

import 'package:data/entity/order/order_entity.dart';

class OrderAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 3;

  @override
  OrderEntity read(BinaryReader reader) {
    final String id = reader.read() as String;
    final CartEntity cart = reader.read() as CartEntity;
    final DateTime dateTime = reader.read() as DateTime;

    return OrderEntity(
      id: id,
      cart: cart,
      dateTime: dateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..write(obj.id)
      ..write(obj.cart)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is OrderAdapter &&
            runtimeType == other.runtimeType &&
            typeId == other.typeId;
  }
}
