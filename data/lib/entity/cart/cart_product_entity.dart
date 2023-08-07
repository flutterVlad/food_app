import '../product/product_entity.dart';

class CartProductEntity {
  final ProductEntity product;
  final int quantity;

  CartProductEntity({
    required this.product,
    required this.quantity,
  });

  factory CartProductEntity.fromJson(Map<dynamic, dynamic> json) =>
      CartProductEntity(
        product: ProductEntity.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toMap() => {
        'product': product.toMap(),
        'quantity': quantity,
      };

  CartProductEntity copyWith({
    ProductEntity? product,
    int? quantity,
  }) =>
      CartProductEntity(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
      );
}
