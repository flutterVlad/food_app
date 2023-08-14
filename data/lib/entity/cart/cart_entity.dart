import 'package:data/entity/cart/cart_product_entity.dart';

class CartEntity {
  final List<CartProductEntity> products;
  final double totalPrice;

  const CartEntity({
    required this.products,
    required this.totalPrice,
  });

  factory CartEntity.fromJson(Map<dynamic, dynamic> json) {
    return CartEntity(
      products: (json['products'] as List<dynamic>)
          .map((product) => CartProductEntity.fromJson(product))
          .toList(),
      totalPrice: (json['totalPrice'] as int).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products.map((product) => product.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }
}
