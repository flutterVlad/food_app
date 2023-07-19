import 'package:data/hive_adapters/products/product_adapter.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
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
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  late final FirebaseDatabase _realtimeDatabase;
  late final FirebaseStorage _storage;
  late final SharedPreferences _preferences;

  Future<void> initDependencies() async {
    await _initFirebase();
    await _initHive();
    _preferences = await _initPreferences();
    _realtimeDatabase = _initDatabase();
    _storage = _initStorage();
    _initLocalDatabase();
    _initProducts();
    _initTheme();
  }

  Future<bool> checkInternet() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }

  // initialization Firebase
  // -----------------------------------------------------------
  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  FirebaseStorage _initStorage() => FirebaseStorage.instance;

  FirebaseDatabase _initDatabase() => FirebaseDatabase.instance;

  FirebaseDatabase get database => _realtimeDatabase;

  FirebaseStorage get storage => _storage;

  // -----------------------------------------------------------

  // initialization Hive
  // -----------------------------------------------------------
  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
  }

  // -----------------------------------------------------------

  // initialization SharedPreferences
  // -----------------------------------------------------------
  Future<SharedPreferences> _initPreferences() async =>
      await SharedPreferences.getInstance();

  // -----------------------------------------------------------

  // initialization products resources
  // -----------------------------------------------------------
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
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllProductsUseCase>(
      () => FetchAllProductsUseCase(
        productRepository: appLocator.get<ProductRepository>(),
      ),
    );
  }

  // -----------------------------------------------------------

  // initialization local database resources
  // -----------------------------------------------------------
  void _initLocalDatabase() {
    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );
  }

  // -----------------------------------------------------------

  // initialization theme resources
  // -----------------------------------------------------------
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

// -----------------------------------------------------------
}
