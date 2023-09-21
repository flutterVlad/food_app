import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:data/entity/order/order_entity.dart';
import 'package:data/entity/cart/cart_entity.dart';
import 'package:data/entity/cart/cart_product_entity.dart';
import 'package:data/entity/user/user_entity.dart';
import 'package:data/entity/product/product_entity.dart';

void main() {
  final OrderEntity orderEntity = OrderEntity(
    id: 'id',
    cart: const CartEntity(
      products: <CartProductEntity>[
        CartProductEntity(
          product: ProductEntity(
            id: 1,
            name: 'name',
            price: '15.00',
            imageUrl: 'image.png',
            description: 'description',
            ingredients: <String>['ing_1', 'ing_2'],
            category: 'category',
          ),
          quantity: 2,
        )
      ],
      totalPrice: 15.00,
    ),
    dateTime: DateTime(23),
    approved: false,
    user: const UserEntity(
      uid: 'uid',
      email: 'gmail@gmail.com',
      userName: 'name',
      role: 'user',
    ),
  );

  test(
    'should be a subclass of OrderEntity',
    () => expect(orderEntity, isA<OrderEntity>()),
  );

  test(
    'should return a valid json',
    () {
      final Map<String, dynamic> jsonMapFromEntity = orderEntity.toMap();
      final Map<String, dynamic> jsonMap = {
        "id": 'id',
        "cart": {
          'products': [
            {
              "product": {
                'id': 1,
                'name': 'name',
                'price': '15.00',
                'imageUrl': 'image.png',
                'description': 'description',
                'ingredients': ['ing_1', 'ing_2'],
                'category': 'category',
              },
              'quantity': 2,
            }
          ],
          "totalPrice": 15.00,
        },
        "datetime": '0023-01-01 00:00:00.000',
        'approved': false,
      };
      expect(jsonMapFromEntity, jsonMap);
    },
  );

  test(
    'should return valid data from json',
    () async {
      final File jsonFile = File('test/helper/order_json.json');
      final Map<String, dynamic> json =
          jsonDecode(await jsonFile.readAsString());
      final OrderEntity orderFromJson = OrderEntity.fromJson(json);
      expect(orderFromJson, isA<OrderEntity>());
    },
  );
}
