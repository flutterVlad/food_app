import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class GetAllCartUseCase
    implements FutureUseCase<NoParams, List<CartProductModel>> {
  final CartRepository _cartRepository;

  GetAllCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<List<CartProductModel>> execute(NoParams input) async {
    return _cartRepository.getAllCart();
  }
}
