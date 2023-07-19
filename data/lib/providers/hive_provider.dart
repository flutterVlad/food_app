import 'package:data/entity/product/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  Future<void> putProductsInBox(List<ProductEntity> products) async {
    Box<ProductEntity> productsBox = await Hive.openBox('products');
    if (productsBox.isEmpty) {
      await productsBox.addAll(products);
    }
    else if (products != productsBox.values.toList()) {
      await Hive.deleteBoxFromDisk('products');
      productsBox = await Hive.openBox('products');
      await productsBox.addAll(products);
    }
    productsBox.close();
  }

  Future<List<ProductEntity>> getProductsFromBox() async {
    final Box<ProductEntity> productsBox = await Hive.openBox('products');
    final List<ProductEntity> result = productsBox.values.toList();
    return result;
  }
}
