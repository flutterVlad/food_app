import 'package:domain/models/cart/cart_product_model.dart';

class CartModel {
  final List<CartProductModel> products;
  final double amount;

  CartModel({
    required this.products,
    required this.amount,
  });

  CartModel copyWith({
    List<CartProductModel>? products,
    double? amount,
  }) =>
      CartModel(
        products: products ?? this.products,
        amount: amount ?? this.amount,
      );

  static CartModel get empty => CartModel(
        products: [],
        amount: 0,
      );
}
