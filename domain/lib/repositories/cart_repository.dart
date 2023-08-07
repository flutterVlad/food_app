import 'package:domain/domain.dart';

abstract class CartRepository {
  Future<List<CartProductModel>> getAllCart();

  Future<void> putProductInCart(ProductModel product);

  Future<void> deleteProductFromCart(CartProductModel cartProductModel);

  Future<void> deleteAllCart();
}
