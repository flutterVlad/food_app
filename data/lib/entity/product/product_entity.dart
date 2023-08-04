class ProductEntity {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final String category;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.category,
  });

  factory ProductEntity.fromJson(Map<dynamic, dynamic> json) => ProductEntity(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        ingredients: List<String>.from(json['ingredients'] ?? []),
        category: json['category'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
        'ingredients': ingredients,
        'category': category,
      };

  ProductEntity copyWith({
    int? id,
    String? name,
    String? price,
    String? imageUrl,
    String? description,
    List<String>? ingredients,
    String? category,
  }) =>
      ProductEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients,
        category: category ?? this.category,
      );
}
