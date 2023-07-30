part of 'home_bloc.dart';

class ProductState {
  final List<ProductModel> products;
  final bool internetConnection;

  ProductState({
    required this.products,
    required this.internetConnection,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    bool? internetConnection,
  }) =>
      ProductState(
        products: products ?? this.products,
        internetConnection: internetConnection ?? this.internetConnection,
      );

  static ProductState get empty => ProductState(
        products: [],
        internetConnection: false,
      );
}
