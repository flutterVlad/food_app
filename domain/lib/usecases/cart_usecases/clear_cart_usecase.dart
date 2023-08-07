import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class ClearCartUseCase implements FutureUseCase<NoParams, void> {
  final CartRepository _cartRepository;

  ClearCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(NoParams input) async {
    await _cartRepository.deleteAllCart();
  }
}
