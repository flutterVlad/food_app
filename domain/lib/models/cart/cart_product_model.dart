import 'package:domain/domain.dart';

class CartProductModel {
  final ProductModel product;
  final int quantity;

  const CartProductModel({
    required this.product,
    required this.quantity,
  });

  CartProductModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartProductModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  static CartProductModel get empty {
    return CartProductModel(
      product: ProductModel.empty,
      quantity: 0,
    );
  }

  bool isEmpty() => this == CartProductModel.empty;

  @override
  int get hashCode => product.hashCode + quantity.hashCode;

  @override
  bool operator ==(Object other) {
    return other is CartProductModel &&
        product == other.product &&
        quantity == other.quantity;
  }
}
