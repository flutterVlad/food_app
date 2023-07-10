import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/models/product/product_model.dart';

part 'event.dart';

part 'state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(EmptyState()) {
    on<AddProductEvent>(_addProduct);
    on<RemoveProductEvent>(_removeProduct);
  }

  void _addProduct(CartEvent event, Emitter emit) {
    state.productList[event.model] = state.productList.containsKey(event.model)
        ? state.productList[event.model] = state.productList[event.model]! + 1
        : state.productList[event.model] = 1;
    emit(
      LoadedState(
        countCartProducts: state.countCartProducts + 1,
        productList: state.productList,
      ),
    );
  }

  void _removeProduct(CartEvent event, Emitter emit) {
    if (state.productList[event.model] == 1) {
      state.productList.remove(event.model);
    } else {
      state.productList[event.model] = state.productList[event.model]! - 1;
    }
    if (state.productList.isNotEmpty) {
      emit(
        LoadedState(
          countCartProducts: state.countCartProducts - 1,
          productList: state.productList,
        ),
      );
    } else {
      emit(EmptyState());
    }
  }
}
