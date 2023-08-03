import 'package:domain/models/product/product_model.dart';
import 'package:domain/repositories/products_repository.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllProductsUseCase implements FutureUseCase<NoParams, List<ProductModel>> {
  final ProductRepository _productRepository;

  const FetchAllProductsUseCase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  Future<List<ProductModel>> execute(NoParams input) async {
    return _productRepository.fetchAllProducts();
  }
}
