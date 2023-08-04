import 'package:data/entity/product/product_entity.dart';
import 'package:hive/hive.dart';

class ProductAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 0;

  @override
  ProductEntity read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<String, dynamic> fields = {};
    for (int i = 0; i < numOfFields; i++) {
      final String key = reader.readString();
      final dynamic value = reader.read();
      fields[key] = value;
    }
    return ProductEntity(
      id: fields['id'] ?? '',
      name: fields['name'] ?? '',
      description: fields['description'] ?? '',
      price: fields['price'] ?? '',
      imageUrl: fields['imageUrl'] ?? '',
      ingredients: List<String>.from(fields['ingredients'] ?? []),
      category: fields['category'],
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(7)
      ..writeString('id')
      ..write(obj.id)
      ..writeString('name')
      ..write(obj.name)
      ..writeString('description')
      ..write(obj.description)
      ..writeString('price')
      ..write(obj.price)
      ..writeString('imageUrl')
      ..write(obj.imageUrl)
      ..writeString('ingredients')
      ..write(obj.ingredients)
      ..writeString('category')
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
