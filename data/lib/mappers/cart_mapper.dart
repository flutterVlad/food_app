import 'package:data/entity/cart/cart_entity.dart';
import 'package:domain/models/cart/cart_model.dart';
import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:domain/models/cart/cart_product_model.dart';
import 'product_mapper.dart';

abstract class CartMapper {
  static CartModel toModel(CartEntity entity) {
    return CartModel(
      products: entity.products
          .map((product) => CartProductModel(
                product: ProductMapper.toModel(product.product),
                quantity: product.quantity,
              ))
          .toList(),
      totalPrice: entity.totalPrice,
    );
  }

  static CartEntity toEntity(CartModel model) {
    return CartEntity(
      products: model.products
          .map((product) => CartProductEntity(
                product: ProductMapper.toEntity(product.product),
                quantity: product.quantity,
              ))
          .toList(),
      totalPrice: model.totalPrice,
    );
  }
}
