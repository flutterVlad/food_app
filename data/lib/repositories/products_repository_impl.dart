import 'package:data/entity/product/product_entity.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/repositories/products_repositories.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:data/mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseProvider _firebaseProvider;

  ProductRepositoryImpl({
    required FirebaseProvider firebaseProvider,
  }) : _firebaseProvider = firebaseProvider;

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductEntity> result = await _firebaseProvider.getProductData('products/');
    return result.map((ProductEntity e) => ProductMapper.toModel(e)).toList();
  }
}
