import 'package:domain/models/cart/cart_product_model.dart';

class CartModel {
  final List<CartProductModel> products;
  final double totalPrice;

  const CartModel({
    required this.products,
    required this.totalPrice,
  });

  CartModel copyWith({
    List<CartProductModel>? products,
    double? totalPrice,
  }) {
    return CartModel(
      products: products ?? this.products,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  static CartModel get empty {
    return const CartModel(
      products: [],
      totalPrice: 0,
    );
  }
}
