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
    final DataSnapshot snapshot = await reference.child(url).get();
    final data = snapshot.value as List<dynamic>;
    for (dynamic firebaseData in data) {
      if (firebaseData != null) {
        final json = firebaseData.cast<String, Object?>();
        ProductEntity product = ProductEntity.fromJson(json);
        result.add(await updateImageUrl(product));
      }
    }
    return result;
  }

  Future<ProductEntity> updateImageUrl(ProductEntity entity) async {
    final Reference storageReference = _storage.ref();
    ProductEntity newEntity = entity.copyWith(
        imageUrl:
            await storageReference.child(entity.imageUrl).getDownloadURL());
    return newEntity;
  }

  Future<void> addOrderOnDatabase({
    required OrderEntity order,
    required String uid,
  }) async {
    final DatabaseReference reference = _database.ref('users');
    final String orderKey = reference.child(uid).child('orders').push().key!;
    await reference.child(uid).child(orderKey).set(order.toMap());
  }

  Future<List<OrderEntity>> getOrderData(String uid) async {
    List<OrderEntity> orders = [];
    final DatabaseReference reference = _database.ref();
    final DataSnapshot snapshot =
        await reference.child('users').child(uid).child('orders').get();
    final List<dynamic> data = snapshot.value as List<dynamic>;
    for (Map<dynamic, dynamic> order in data) {
      orders.add(OrderEntity.fromJson(order));
    }

    return orders;
  }
}
