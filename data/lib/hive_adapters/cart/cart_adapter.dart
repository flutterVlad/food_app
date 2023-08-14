import 'package:data/entity/cart/cart_entity.dart';
import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:hive/hive.dart';

class CartAdapter extends TypeAdapter<CartEntity> {
  @override
  final int typeId = 2;

  @override
  CartEntity read(BinaryReader reader) {
    final int productsLength = reader.read() as int;
    final List<CartProductEntity> products = [];
    for (int i = 0; i < productsLength; i++) {
      final CartProductEntity product = reader.read() as CartProductEntity;
      products.add(product);
    }
    final double totalPrice = reader.read() as double;

    return CartEntity(
      products: products,
      totalPrice: totalPrice,
    );
  }

  @override
  void write(BinaryWriter writer, CartEntity obj) {
    writer.write(obj.products.length);
    for (final CartProductEntity product in obj.products) {
      writer.write(product);
    }
    writer.write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CartAdapter &&
            runtimeType == other.runtimeType &&
            typeId == other.typeId;
  }
}
