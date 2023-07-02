import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  factory ProductEntity({
    required int id,
    required String name,
    required String price,
    required String imageUrl,
}) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, Object?> json) =>
      _$ProductEntityFromJson(json);
}
