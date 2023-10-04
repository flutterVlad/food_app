part of 'home_bloc.dart';

class ProductState extends Equatable {
  final List<ProductModel> products;
  final bool internetConnection;
  final List<String> categories;
  final List<ProductModel> allProducts;
  final List<bool> activatedFilterList;

  const ProductState({
    required this.products,
    required this.internetConnection,
    required this.categories,
    required this.allProducts,
    required this.activatedFilterList,
  });

  @override
  List<Object> get props => [
        products,
        internetConnection,
        categories,
        allProducts,
        activatedFilterList,
      ];

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
    return const ProductState(
      products: [],
      internetConnection: true,
      categories: [],
      allProducts: [],
      activatedFilterList: [],
    );
  }
}
