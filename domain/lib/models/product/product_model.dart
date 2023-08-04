import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String name,
    required String price,
    required String imageUrl,
    required String description,
    required List<String> ingredients,
    required String category,
  }) = _ProductModel;
}
