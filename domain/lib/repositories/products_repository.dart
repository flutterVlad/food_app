import 'dart:io';
import 'package:domain/domain.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchAllProducts();

  Future<void> addProduct(ProductModel productModel);

  Future<void> removeProduct(String id);

  Future<void> updateProduct(ProductModel productModel);

  Future<String> uploadImage(File imageFile);
}
