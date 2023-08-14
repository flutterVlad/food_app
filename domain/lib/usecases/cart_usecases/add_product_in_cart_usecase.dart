import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class AddProductInCartUseCase implements FutureUseCase<ProductModel, void> {
  final CartRepository _cartRepository;

  AddProductInCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(ProductModel product) async {
    await _cartRepository.addProductInCart(product);
  }
}
