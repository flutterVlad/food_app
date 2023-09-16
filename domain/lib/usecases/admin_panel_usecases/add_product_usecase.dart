import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class AddProductUseCase extends FutureUseCase<ProductModel, void> {
  final ProductRepository _productRepository;

  AddProductUseCase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<void> execute(ProductModel productModel) async {
    await _productRepository.addProduct(productModel);
  }
}
