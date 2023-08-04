import 'package:data/entity/cart/cart_product_entity.dart';

class CartEntity {
  final List<CartProductEntity> products;
  final double amount;

  CartEntity({
    required this.products,
    required this.amount,
  });

  factory CartEntity.fromJson(Map<dynamic, dynamic> json) => CartEntity(
        products: (json['products'] as List<dynamic>)
            .map((product) => CartProductEntity.fromJson(json[product]))
            .toList(),
        amount: json['quantity'],
      );

  Map<String, dynamic> toMap() => {
        'products': products.map((product) => product.toMap()).toList(),
        'amount': amount,
      };
}
