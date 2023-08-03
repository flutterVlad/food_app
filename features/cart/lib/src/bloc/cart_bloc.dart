import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:navigation/navigation.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AppRouter _router;

  CartBloc({
    required AppRouter appRouter,
  })  : _router = appRouter,
        super(
          CartState(
            countCartProducts: 0,
            productsMap: {},
          ),
        ) {
    on<RouteToDetailPageEvent>(_routeToDetailPage);
    on<AddProductEvent>(_addProduct);
    on<RemoveProductEvent>(_removeProduct);
  }

  void _addProduct(AddProductEvent event, Emitter emit) {
    Map<ProductModel, int> updatedProducts = state.productsMap;
    updatedProducts[event.model] = updatedProducts.containsKey(event.model)
        ? updatedProducts[event.model]! + 1
        : 1;
    emit(
      state.copyWith(
        countCartProducts: state.countCartProducts + 1,
        productsMap: updatedProducts,
      ),
    );
  }

  void _removeProduct(RemoveProductEvent event, Emitter emit) {
    Map<ProductModel, int> updatedProducts = state.productsMap;
    if (updatedProducts[event.model] == 1) {
      updatedProducts.remove(event.model);
    } else {
      updatedProducts[event.model] = updatedProducts[event.model]! - 1;
    }
    if (updatedProducts.isNotEmpty) {
      emit(
        state.copyWith(
          countCartProducts: state.countCartProducts - 1,
          productsMap: updatedProducts,
        ),
      );
    } else {
      emit(
        state.copyWith(
          countCartProducts: 0,
          productsMap: {},
        ),
      );
    }
  }

  void _routeToDetailPage(RouteToDetailPageEvent event, Emitter emit) {
    _router.navigate(
      ProductDetailRoute(model: event.model),
    );
  }
}
