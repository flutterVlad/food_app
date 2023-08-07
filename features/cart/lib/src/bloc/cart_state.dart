part of 'cart_bloc.dart';

class CartState {
  final int countCartProducts;
  final CartModel cart;

  CartState({
    required this.countCartProducts,
    required this.cart,
  });

  CartState copyWith({
    int? countCartProducts,
    CartModel? cart,
  }) {
    return CartState(
      countCartProducts: countCartProducts ?? this.countCartProducts,
      cart: cart ?? this.cart,
    );
  }

  double getAmountOfOneProduct(double price, int count) => price * count;
}
