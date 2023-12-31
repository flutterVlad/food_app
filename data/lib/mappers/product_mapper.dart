import 'package:domain/models/product/product_model.dart';
import 'package:data/entity/product/product_entity.dart';

abstract class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      name: model.name,
      price: model.price,
      imageUrl: model.imageUrl,
      description: model.description,
      ingredients: model.ingredients,
      category: model.category,
    );
  }

  static ProductModel toModel(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      imageUrl: entity.imageUrl,
      description: entity.description,
      ingredients: entity.ingredients,
      category: entity.category,
    );
  }
}
