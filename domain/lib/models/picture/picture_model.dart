import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';

@freezed
class PictureModel with _$PictureModel {
  factory PictureModel({
    required int productId,
    required int id,
    required String title,
    required String url,
  }) = _PictureModel;
}
