import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core/config/firebase_options.dart';

final FirebaseDI firebaseDI = FirebaseDI();

class FirebaseDI {
  void initDependencies() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}