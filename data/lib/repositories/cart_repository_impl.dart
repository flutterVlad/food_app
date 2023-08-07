import 'package:data/data.dart';
import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:data/entity/product/product_entity.dart';
import 'package:data/mappers/cart_product_mapper.dart';
import 'package:data/mappers/product_mapper.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveProvider _hiveProvider;

  CartRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<List<CartProductModel>> getAllCart() async {
    final List<CartProductEntity> products = await _hiveProvider.getAllCart();
    return products
        .map((cartProduct) => CartProductMapper.toModel(cartProduct))
        .toList();
  }

  @override
  Future<void> putProductInCart(
    ProductModel product,
  ) async {
    final ProductEntity productEntity = ProductMapper.toEntity(product);
    await _hiveProvider.putCartProductInBox(productEntity);
  }

  @override
  Future<void> deleteProductFromCart(
    CartProductModel cartProductModel,
  ) async {
    final CartProductEntity cartProductEntity =
        CartProductMapper.toEntity(cartProductModel);
    await _hiveProvider.deleteCartProductFromBox(cartProductEntity);
  }

  @override
  Future<void> deleteAllCart() async {
    await _hiveProvider.deleteAllCart();
  }
}
