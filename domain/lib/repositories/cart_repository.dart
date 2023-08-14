import 'package:domain/domain.dart';

abstract class CartRepository {
  Future<List<CartProductModel>> getAllCart();

  Future<void> addProductInCart(ProductModel product);

  Future<void> deleteProductFromCart(CartProductModel cartProductModel);

  Future<void> deleteAllCart();
}
