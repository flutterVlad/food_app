import 'dart:io';
import 'package:data/entity/user/user_entity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:data/entity/product/product_entity.dart';
import 'package:data/entity/order/order_entity.dart';

class FirebaseProvider {
  final FirebaseDatabase _database;
  final FirebaseStorage _storage;

  FirebaseProvider({
    required FirebaseDatabase database,
    required FirebaseStorage storage,
  })  : _database = database,
        _storage = storage;

  Future<List<ProductEntity>> getProductData(String url) async {
    List<ProductEntity> result = [];
    final DatabaseReference reference = _database.ref();
    final DataSnapshot productsSnapshot = await reference.child(url).get();
    final data = productsSnapshot.value as List<dynamic>;
    for (dynamic firebaseData in data) {
      if (firebaseData != null) {
        final json = firebaseData.cast<String, Object?>();
        final ProductEntity product = ProductEntity.fromJson(json);
        result.add(product);
      }
    }
    return result;
  }

  Future<void> addOrderOnDatabase({
    required OrderEntity order,
    required String uid,
  }) async {
    final DatabaseReference reference = _database.ref('users/$uid/orders');
    final DatabaseReference orderKeyRef = reference.push();
    await orderKeyRef.set(order.copyWith(id: orderKeyRef.key).toMap());
  }

  Future<List<OrderEntity>> getOrderData(String uid) async {
    final List<OrderEntity> orders = [];
    try {
      final DatabaseReference reference = _database.ref('users/$uid');
      final DataSnapshot orderSnapshot = await reference.child('orders').get();
      final DataSnapshot userSnapshot = await reference.get();
      final Map<dynamic, dynamic> data =
          orderSnapshot.value as Map<dynamic, dynamic>;
      for (final dynamic order in data.values) {
        order['user'] = userSnapshot.value;
        orders.add(OrderEntity.fromJson(order));
      }
    } catch (error) {}

    return orders;
  }

  Future<void> addProduct(ProductEntity productEntity) async {
    try {
      final DatabaseReference productsReference = _database.ref('products');
      final DataSnapshot productSnapshot = await productsReference.get();
      if (productSnapshot.exists) {
        final List<dynamic> data = productSnapshot.value as List<dynamic>;
        final int id = data.last['id'];
        final ProductEntity newProduct = productEntity.copyWith(id: id + 1);
        await productsReference.child('${id + 1}').set(newProduct.toMap());
      } else {
        final ProductEntity newProduct = productEntity.copyWith(id: 0);
        await productsReference.child('0').set(newProduct.toMap());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      final Reference storageReference =
          _storage.ref('productImage').child('$imageFile');

      await storageReference.putFile(imageFile);

      final String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (error) {
      return '';
    }
  }

  Future<void> removeProduct(String id) async {
    await _database.ref('products').child(id).remove();
  }

  Future<void> updateProduct(ProductEntity productEntity) async {
    await _database
        .ref('products')
        .child(productEntity.id.toString())
        .update(productEntity.toMap());
  }

  Future<List<OrderEntity>> fetchAllOrders() async {
    final List<OrderEntity> orders = [];
    final DatabaseReference reference = _database.ref('users');
    final DataSnapshot snapshot = await reference.get();

    if (snapshot.exists) {
      final dynamic snapshotValues = snapshot.value;

      for (dynamic user in snapshotValues.values) {
        for (dynamic order in user['orders'].values) {
          order['user'] = user;
          orders.add(OrderEntity.fromJson(order));
        }
      }
    }

    return orders;
  }

  Future<List<UserEntity>> fetchAllUsers() async {
    final List<UserEntity> users = [];
    final DatabaseReference reference = _database.ref('users');
    final DataSnapshot snapshot = await reference.get();

    if (snapshot.exists) {
      final dynamic snapshotValues = snapshot.value;
      for (dynamic user in snapshotValues.values) {
        users.add(UserEntity.fromJson(user));
      }
    }

    return users;
  }

  Future<void> approveOrders({
    required List<OrderEntity> orders,
  }) async {
    final DatabaseReference reference = _database.ref('users');

    for (OrderEntity order in orders) {
      try {
        await reference
            .child(order.user.uid)
            .child('orders')
            .child(order.id)
            .update(order.toMap());
      } on FirebaseException catch (error) {}
    }
  }
}
