part of 'home_bloc.dart';

class ProductState {
  final List<ProductModel> products;
  final bool internetConnection;
  final List<String> categories;
  final List<ProductModel> allProducts;
  final List<bool> activatedFilterList;

  ProductState({
    required this.products,
    required this.internetConnection,
    required this.categories,
    required this.allProducts,
    required this.activatedFilterList,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    bool? internetConnection,
    List<String>? categories,
    List<ProductModel>? allProducts,
    List<bool>? activatedFilterList,
  }) {
    return ProductState(
      products: products ?? this.products,
      internetConnection: internetConnection ?? this.internetConnection,
      categories: categories ?? this.categories,
      allProducts: allProducts ?? this.allProducts,
      activatedFilterList: activatedFilterList ?? this.activatedFilterList,
    );
  }

  static ProductState get empty {
    return ProductState(
      products: [],
      internetConnection: false,
      categories: [],
      allProducts: [],
      activatedFilterList: [],
    );
  }
}
