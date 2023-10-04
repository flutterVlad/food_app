import 'dart:io';
import 'package:core/core.dart';
import 'package:data/entity/product/product_entity.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
import 'package:domain/domain.dart';
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
    return result
        .map((ProductEntity entity) => ProductMapper.toModel(entity))
        .toList();
  }

  @override
  Future<void> addProduct(ProductModel productModel) async {
    await _firebaseProvider.addProduct(ProductMapper.toEntity(productModel));
  }

  @override
  Future<void> removeProduct(String id) async {
    await _firebaseProvider.removeProduct(id);
  }

  @override
  Future<void> updateProduct(ProductModel productModel) async {
    await _firebaseProvider.updateProduct(ProductMapper.toEntity(productModel));
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    return await _firebaseProvider.uploadImage(imageFile);
  }
}
