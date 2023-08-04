import '../product/product_entity.dart';

class CartProductEntity {
  final ProductEntity productEntity;
  final int quantity;

  CartProductEntity({
    required this.productEntity,
    required this.quantity,
  });

  factory CartProductEntity.fromJson(Map<dynamic, dynamic> json) =>
      CartProductEntity(
        productEntity: ProductEntity.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toMap() => {
        'product': productEntity.toMap(),
        'quantity': quantity,
      };
}
