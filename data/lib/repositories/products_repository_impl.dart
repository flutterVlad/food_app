import 'package:core/core.dart';
import 'package:data/entity/product/product_entity.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
import 'package:domain/repositories/products_repository.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:data/mappers/product_mapper.dart';


class ProductRepositoryImpl implements ProductRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;

  ProductRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductEntity> result;
    final bool isInternetAvailable = await dataDI.checkInternet();
    if (isInternetAvailable) {
      result = await _firebaseProvider.getProductData('products/');
      _hiveProvider.putProductsInBox(result);
    } else {
      result = await _hiveProvider.getProductsFromBox();
    }
    return result.map((ProductEntity entity) =>
        ProductMapper.toModel(entity)).toList();
  }
}
