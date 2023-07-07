// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductEntity _$$_ProductEntityFromJson(Map<String, dynamic> json) =>
    _$_ProductEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ProductEntityToJson(_$_ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'ingredients': instance.ingredients,
    };
