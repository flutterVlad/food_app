part of 'cart_bloc.dart';

class CartState {
  final int countCartProducts;
  final Map<ProductModel, int> productsMap;

  CartState({
    required this.countCartProducts,
    required this.productsMap,
  });

  CartState copyWith({
    int? countCartProducts,
    Map<ProductModel, int>? productsMap,
  }) {
    return CartState(
      countCartProducts: countCartProducts ?? this.countCartProducts,
      productsMap: productsMap ?? this.productsMap,
    );
  }

  List<ProductModel> get products => productsMap.keys.toList();

  List<int> get quantity => productsMap.values.toList();

  double getTotalAmount() {
    double sum = 0;
    for (final element in productsMap.entries) {
      sum += double.parse(element.key.price) * element.value;
    }
    return sum;
  }
}
