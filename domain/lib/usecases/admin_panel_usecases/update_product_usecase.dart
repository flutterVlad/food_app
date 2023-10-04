import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

class UpdateProductUseCase extends FutureUseCase<ProductModel, void> {
  final ProductRepository _productRepository;

  UpdateProductUseCase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<void> execute(ProductModel productModel) async {
    await _productRepository.updateProduct(productModel);
  }
}
