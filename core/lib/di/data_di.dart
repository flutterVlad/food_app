import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/preferences_provider.dart';
import 'package:data/repositories/preferences_repository_impl.dart';
import 'package:data/repositories/products_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:core/config/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  late final FirebaseDatabase _realtimeDatabase;
  late final FirebaseStorage _storage;
  late final SharedPreferences _preferences;

  Future<void> initDependencies() async {
    await _initFirebase();
    _preferences = await _initPreferences();
    _realtimeDatabase = _initDatabase();
    _storage = _initStorage();
    _initProducts();
    _initTheme();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  FirebaseStorage _initStorage() => FirebaseStorage.instance;

  FirebaseDatabase _initDatabase() => FirebaseDatabase.instance;

  Future<SharedPreferences> _initPreferences() async =>
      await SharedPreferences.getInstance();

  FirebaseDatabase get database => _realtimeDatabase;

  FirebaseStorage get storage => _storage;

  void _initProducts() {
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(
        database: _realtimeDatabase,
        storage: _storage,
      ),
    );

    appLocator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        firebaseProvider: appLocator.get<FirebaseProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllProductsUseCase>(
      () => FetchAllProductsUseCase(
        productRepository: appLocator.get<ProductRepository>(),
      ),
    );
  }

  void _initTheme() {
    appLocator.registerLazySingleton<PreferencesProvider>(
      () => PreferencesProvider(preferences: _preferences),
    );

    appLocator.registerLazySingleton<PreferencesRepositoryImpl>(
      () => PreferencesRepositoryImpl(
        preferencesProvider: appLocator.get<PreferencesProvider>(),
      ),
    );

    appLocator.registerLazySingleton<SetThemeDataUseCase>(
      () => SetThemeDataUseCase(
        preferencesRepository: appLocator.get<PreferencesRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<CheckThemeDataUseCase>(
      () => CheckThemeDataUseCase(
        preferencesRepository: appLocator.get<PreferencesRepositoryImpl>(),
      ),
    );
  }
}
