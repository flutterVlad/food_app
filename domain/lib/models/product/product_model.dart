import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
  required int id,
  required String name,
  required String price,
  required String imageUrl,
}) = _ProductModel;
}
