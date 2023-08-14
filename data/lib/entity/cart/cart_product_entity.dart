import '../product/product_entity.dart';

class CartProductEntity {
  final ProductEntity product;
  final int quantity;

  const CartProductEntity({
    required this.product,
    required this.quantity,
  });

  factory CartProductEntity.fromJson(Map<dynamic, dynamic> json) {
    return CartProductEntity(
      product: ProductEntity.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  CartProductEntity copyWith({
    ProductEntity? product,
    int? quantity,
  }) {
    return CartProductEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
