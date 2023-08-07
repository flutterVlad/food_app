import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:data/entity/product/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  Future<void> putProductsInBox(
    List<ProductEntity> products,
  ) async {
    Box<ProductEntity> productsBox = await Hive.openBox('products');
    if (productsBox.isEmpty) {
      await productsBox.addAll(products);
    } else if (products != productsBox.values.toList()) {
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

  Future<void> putCartProductInBox(
    ProductEntity product,
  ) async {
    final Box<CartProductEntity> cartBox = await Hive.openBox('cart');
    final List<CartProductEntity> cartProducts = cartBox.values.toList();

    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].product.name == product.name) {
        cartBox.put(
          product.name,
          CartProductEntity(
            product: product,
            quantity: cartProducts[i].quantity + 1,
          ),
        );
        return;
      }
    }
    cartBox.put(
      product.name,
      CartProductEntity(product: product, quantity: 1),
    );
  }

  Future<void> deleteCartProductFromBox(
    CartProductEntity cartProductEntity,
  ) async {
    final Box<CartProductEntity> cartBox = await Hive.openBox('cart');

    if (cartProductEntity.quantity > 1) {
      cartProductEntity =
          cartProductEntity.copyWith(quantity: cartProductEntity.quantity - 1);
      cartBox.put(cartProductEntity.product.name, cartProductEntity);
    } else {
      cartBox.delete(cartProductEntity.product.name);
    }
  }

  Future<List<CartProductEntity>> getAllCart() async {
    final Box<CartProductEntity> cartBox = await Hive.openBox('cart');
    return cartBox.values.toList();
  }

  Future<void> deleteAllCart() async {
    final Box<CartProductEntity> cartBox = await Hive.openBox('cart');
    cartBox.clear();
  }
}
