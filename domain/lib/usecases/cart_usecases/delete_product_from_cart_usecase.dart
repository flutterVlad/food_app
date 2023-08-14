import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class DeleteProductFromCartUseCase
    implements FutureUseCase<CartProductModel, void> {
  final CartRepository _cartRepository;

  DeleteProductFromCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartProductModel product) async {
    await _cartRepository.deleteProductFromCart(product);
  }
}
