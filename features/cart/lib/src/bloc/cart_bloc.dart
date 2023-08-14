import 'package:domain/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:domain/usecases/export_usecases.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AppRouter _router;
  final AddProductInCartUseCase _putProductInCartUseCase;
  final GetAllCartUseCase _getAllCartUseCase;
  final DeleteProductFromCartUseCase _deleteProductFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  CartBloc({
    required AppRouter appRouter,
    required AddProductInCartUseCase putProductInCartUseCase,
    required GetAllCartUseCase getAllCartUseCase,
    required DeleteProductFromCartUseCase deleteProductFromCartUseCase,
    required ClearCartUseCase clearCartUseCase,
  })  : _router = appRouter,
        _putProductInCartUseCase = putProductInCartUseCase,
        _getAllCartUseCase = getAllCartUseCase,
        _deleteProductFromCartUseCase = deleteProductFromCartUseCase,
        _clearCartUseCase = clearCartUseCase,
        super(
          CartState(
            countCartProducts: 0,
            cart: CartModel.empty,
          ),
        ) {
    on<RouteToDetailPageEvent>(_routeToDetailPage);
    on<AddProductEvent>(_addProduct);
    on<RemoveProductEvent>(_removeProduct);
    on<InitEvent>(_initCart);
    on<CreateOrderEvent>(_clearCart);

    add(InitEvent());
  }

  Future<void> _initCart(
    InitEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<CartProductModel> cartProducts =
        await _getAllCartUseCase.execute(const NoParams());
    int countProducts = 0;
    double totalPrice = 0;
    for (final CartProductModel model in cartProducts) {
      countProducts += model.quantity;
      totalPrice += model.quantity * double.parse(model.product.price);
    }
    emit(
      state.copyWith(
        countCartProducts: countProducts,
        cart: state.cart.copyWith(
          products: cartProducts,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  Future<void> _addProduct(
    AddProductEvent event,
    Emitter emit,
  ) async {
    await _putProductInCartUseCase.execute(event.productModel);
    final List<CartProductModel> cartProducts =
        await _getAllCartUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        countCartProducts: state.countCartProducts + 1,
        cart: state.cart.copyWith(
          products: cartProducts,
          totalPrice:
              state.cart.totalPrice + double.parse(event.productModel.price),
        ),
      ),
    );
  }

  Future<void> _removeProduct(
    RemoveProductEvent event,
    Emitter emit,
  ) async {
    await _deleteProductFromCartUseCase.execute(event.productModel);
    final List<CartProductModel> cartProducts =
        await _getAllCartUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        countCartProducts: state.countCartProducts - 1,
        cart: state.cart.copyWith(
          products: cartProducts,
          totalPrice: state.cart.totalPrice -
              double.parse(event.productModel.product.price),
        ),
      ),
    );
  }

  Future<void> _clearCart(
    CreateOrderEvent event,
    Emitter<CartState> emit,
  ) async {
    await _clearCartUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        countCartProducts: 0,
        cart: CartModel.empty,
      ),
    );
  }

  void _routeToDetailPage(RouteToDetailPageEvent event, Emitter emit) {
    _router.navigate(
      ProductDetailRoute(model: event.model),
    );
  }
}
