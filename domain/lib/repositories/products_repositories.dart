import 'package:domain/models/product/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchAllProducts();
}
