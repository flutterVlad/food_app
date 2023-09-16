import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class RemoveProductUseCase extends FutureUseCase<String, void> {
  final ProductRepository _productRepository;

  RemoveProductUseCase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<void> execute(String id) async {
    await _productRepository.removeProduct(id);
  }
}
