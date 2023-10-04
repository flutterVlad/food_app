import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:navigation/navigation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchAllProductsUseCase _fetchAllProductsUseCase;
  final AppRouter _router;

  ProductBloc({
    required FetchAllProductsUseCase fetchAllProductsUseCase,
    required AppRouter appRouter,
  })  : _fetchAllProductsUseCase = fetchAllProductsUseCase,
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

  Future<void> _init(
    InitEvent event,
    Emitter<ProductState> emit,
  ) async {
    add(CheckInternetEvent());
    final List<ProductModel> products = await _fetchAllProductsUseCase.execute(
      const NoParams(),
    );
    final List<String> categories = products
        .map((ProductModel product) => product.category)
        .toSet()
        .toList();
    emit(
      state.copyWith(
        products: products,
        categories: categories,
        allProducts: products,
        activatedFilterList: List.filled(categories.length, false),
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
    final List<bool> updatedFilterList = List.generate(
      state.allProducts.length,
      (int index) => event.index == index ? true : false,
    );
    emit(
      state.copyWith(
        products: filteredProducts,
        activatedFilterList: updatedFilterList,
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
        activatedFilterList: List.filled(state.allProducts.length, false),
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
