part of 'bloc.dart';

abstract class CartState {
  final int countCartProducts = 0;
  final Map<ProductModel, int> productList = {};
}

class EmptyState extends CartState {}

class LoadedState extends CartState {
  @override
  final int countCartProducts;

  @override
  final Map<ProductModel, int> productList;

  LoadedState({
    required this.countCartProducts,
    required this.productList,
  });

  List<ProductModel> get products => productList.keys.toList();

  List<int> get quantity => productList.values.toList();

  double getTotalAmount() {
    double sum = 0;
    for (final element in productList.entries) {
      sum += double.parse(element.key.price) * element.value;
    }
    return sum;
  }
}
