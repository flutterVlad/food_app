import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class PutProductInCartUseCase implements FutureUseCase<ProductModel, void> {
  final CartRepository _cartRepository;

  PutProductInCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(ProductModel product) async {
    await _cartRepository.putProductInCart(product);
  }
}
