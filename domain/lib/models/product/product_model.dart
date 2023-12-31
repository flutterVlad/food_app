import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final String category;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.category,
  });

  @override
  List<Object> get props => [
        id,
        name,
        price,
        imageUrl,
        description,
        ingredients,
        category,
      ];

  ProductModel copyWith({
    int? id,
    String? name,
    String? price,
    String? imageUrl,
    String? description,
    List<String>? ingredients,
    String? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      category: category ?? this.category,
    );
  }

  Map<String, String> toMap() {
    return {
      'Name': name,
      'Description': description,
      'Price': price,
    };
  }

  static Map<String, dynamic> get defaultFields {
    return {
      'Name': '',
      'Description': '',
      'Price': '',
    };
  }

  static ProductModel get empty {
    return const ProductModel(
      id: 0,
      name: '',
      price: '',
      imageUrl: '',
      description: '',
      ingredients: [],
      category: '',
    );
  }

  bool isEmpty() => this == ProductModel.empty;
}
