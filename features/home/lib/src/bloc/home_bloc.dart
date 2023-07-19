import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';

part 'home_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchAllProductsUseCase _getAllProductsUseCase;

  ProductBloc({
    required FetchAllProductsUseCase getAllProductsUseCase,
  })  : _getAllProductsUseCase = getAllProductsUseCase,
        super(EmptyState()) {
    on<InitEvent>(_init);
    on<NavigateToDetailPageEvent>(_navigateToDetailPage);
  }

  void _init(InitEvent event, Emitter<ProductState> emit) {
    _loadProductList();
  }

  Future<void> _loadProductList() async {
    emit(LoadingState(await dataDI.checkInternet()));
    final List<ProductModel> products = await _getAllProductsUseCase.execute(
      const NoParams(),
    );
    emit(LoadedState(products: products));
  }

  void _navigateToDetailPage(NavigateToDetailPageEvent event, Emitter<ProductState> emit) {
    event.context.router.push(
      ProductDetailRoute(model: event.model),
    );
  }
}
