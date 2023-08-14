import 'package:hive/hive.dart';

import 'package:data/entity/cart/cart_product_entity.dart';

class CartProductAdapter extends TypeAdapter<CartProductEntity> {
  @override
  final int typeId = 1;

  @override
  CartProductEntity read(BinaryReader reader) {
    return CartProductEntity(
      product: reader.read(),
      quantity: reader.read() as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductEntity obj) {
    writer
      ..write(obj.product)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CartProductAdapter &&
            runtimeType == other.runtimeType &&
            typeId == other.typeId;
  }
}
