// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PictureModel {
  int get productId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureModelCopyWith<PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureModelCopyWith<$Res> {
  factory $PictureModelCopyWith(
          PictureModel value, $Res Function(PictureModel) then) =
      _$PictureModelCopyWithImpl<$Res, PictureModel>;
  @useResult
  $Res call({int productId, int id, String title, String url});
}

/// @nodoc
class _$PictureModelCopyWithImpl<$Res, $Val extends PictureModel>
    implements $PictureModelCopyWith<$Res> {
  _$PictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PictureModelCopyWith<$Res>
    implements $PictureModelCopyWith<$Res> {
  factory _$$_PictureModelCopyWith(
          _$_PictureModel value, $Res Function(_$_PictureModel) then) =
      __$$_PictureModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int id, String title, String url});
}

/// @nodoc
class __$$_PictureModelCopyWithImpl<$Res>
    extends _$PictureModelCopyWithImpl<$Res, _$_PictureModel>
    implements _$$_PictureModelCopyWith<$Res> {
  __$$_PictureModelCopyWithImpl(
      _$_PictureModel _value, $Res Function(_$_PictureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$_PictureModel(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PictureModel implements _PictureModel {
  _$_PictureModel(
      {required this.productId,
      required this.id,
      required this.title,
      required this.url});

  @override
  final int productId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'PictureModel(productId: $productId, id: $id, title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PictureModel &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, id, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PictureModelCopyWith<_$_PictureModel> get copyWith =>
      __$$_PictureModelCopyWithImpl<_$_PictureModel>(this, _$identity);
}

abstract class _PictureModel implements PictureModel {
  factory _PictureModel(
      {required final int productId,
      required final int id,
      required final String title,
      required final String url}) = _$_PictureModel;

  @override
  int get productId;
  @override
  int get id;
  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PictureModelCopyWith<_$_PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
