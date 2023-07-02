import 'package:domain/models/product/product_model.dart';
import 'package:data/entity/product/product_entity.dart';

abstract class ProductMapper {
  static ProductEntity toEntity(ProductModel model) => ProductEntity(
        id: model.id,
        name: model.name,
        price: model.price,
        imageUrl: model.imageUrl,
      );

  static ProductModel toModel(ProductEntity entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        price: entity.price,
        imageUrl: entity.imageUrl,
      );
}
