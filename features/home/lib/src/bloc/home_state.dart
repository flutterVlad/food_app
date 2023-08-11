part of 'home_bloc.dart';

class ProductState {
  final List<ProductModel> products;
  final bool internetConnection;
  final List<String> categories;
  final List<ProductModel> allProducts;

  ProductState(
      {required this.products,
      required this.internetConnection,
      required this.categories,
      required this.allProducts});

  ProductState copyWith({
    List<ProductModel>? products,
    bool? internetConnection,
    List<String>? categories,
    List<ProductModel>? allProducts,
  }) =>
      ProductState(
        products: products ?? this.products,
        internetConnection: internetConnection ?? this.internetConnection,
        categories: categories ?? this.categories,
        allProducts: allProducts ?? this.allProducts,
      );

  static ProductState get empty => ProductState(
        products: [],
        internetConnection: false,
        categories: [],
        allProducts: [],
      );
}
