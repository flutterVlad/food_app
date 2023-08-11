import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:navigation/navigation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'home_event.dart';

part 'home_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchAllProductsUseCase _getAllProductsUseCase;
  final AppRouter _router;

  ProductBloc({
    required FetchAllProductsUseCase getAllProductsUseCase,
    required AppRouter appRouter,
  })  : _getAllProductsUseCase = getAllProductsUseCase,
        _router = appRouter,
        super(ProductState.empty) {
    on<InitEvent>(_init);
    on<NavigateToDetailPageEvent>(_navigateToDetailPage);
    on<CheckInternetEvent>(_checkInternet);
    on<FilterByCategoryEvent>(_filteringByCategory);
    on<ShowAllProductsEvent>(_showAllProducts);

    Connectivity().onConnectivityChanged.listen((_) {
      add(CheckInternetEvent());
    });

    add(InitEvent());
  }

  void _init(
    InitEvent event,
    Emitter<ProductState> emit,
  ) {
    _loadProductList();
  }

  Future<void> _loadProductList() async {
    add(CheckInternetEvent());
    final List<ProductModel> products = await _getAllProductsUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        products: products,
        categories: products.map((product) => product.category).toSet().toList(),
        allProducts: products,
      ),
    );
  }

  Future<void> _filteringByCategory(
    FilterByCategoryEvent event,
    Emitter<ProductState> emit,
  ) async {
    final List<ProductModel> filteredProducts = state.allProducts
        .where((product) => product.category == event.category)
        .toList();
    emit(
      state.copyWith(
        products: filteredProducts,
      ),
    );
  }

  Future<void> _showAllProducts(
    _,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        products: state.allProducts,
      ),
    );
  }

  void _navigateToDetailPage(
    NavigateToDetailPageEvent event,
    Emitter<ProductState> emit,
  ) {
    _router.navigate(
      ProductDetailRoute(model: event.model),
    );
  }

  Future<void> _checkInternet(
    CheckInternetEvent event,
    Emitter<ProductState> emit,
  ) async {
    final bool internetConnection = await dataDI.checkInternet();
    emit(
      state.copyWith(
        internetConnection: internetConnection,
      ),
    );
  }
}
