import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:data/mappers/product_mapper.dart';
import 'package:domain/models/cart/cart_product_model.dart';

abstract class CartProductMapper {
  static CartProductModel toModel(CartProductEntity entity) => CartProductModel(
        product: ProductMapper.toModel(entity.product),
        quantity: entity.quantity,
      );

  static CartProductEntity toEntity(CartProductModel model) =>
      CartProductEntity(
        product: ProductMapper.toEntity(model.product),
        quantity: model.quantity,
      );
}
