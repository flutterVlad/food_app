import 'package:domain/domain.dart';

class CartProductModel {
  final ProductModel product;
  final int quantity;

  CartProductModel({
    required this.product,
    required this.quantity,
  });

  CartProductModel copyWith({
    ProductModel? product,
    int? quantity,
  }) =>
      CartProductModel(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
      );

  static CartProductModel get empty =>
      CartProductModel(product: ProductModel.empty, quantity: 0);

  bool isEmpty() => this == CartProductModel.empty;

  @override
  int get hashCode => product.hashCode + quantity.hashCode;

  @override
  bool operator ==(Object other) =>
      other is CartProductModel &&
      product == other.product &&
      quantity == other.quantity;
}
