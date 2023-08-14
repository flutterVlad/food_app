import 'package:firebase_core/firebase_core.dart';
import 'package:core/config/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  late final FirebaseDatabase _realtimeDatabase;
  late final FirebaseStorage _storage;
  late final FirebaseAuth _firebaseAuth;
  late final SharedPreferences _preferences;

  Future<void> initDependencies() async {
    await _initFirebase();
    await _initHive();
    _preferences = await _initPreferences();
    _realtimeDatabase = _initDatabase();
    _storage = _initStorage();
    _firebaseAuth = _initFirebaseAuth();
    _initLocalDatabase();
    _initOrders();
    _initAuthResources();
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

  FirebaseAuth _initFirebaseAuth() => FirebaseAuth.instance;

  FirebaseDatabase get database => _realtimeDatabase;

  FirebaseStorage get storage => _storage;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  // -----------------------------------------------------------

  // initialization auth resources
  // -----------------------------------------------------------
  void _initAuthResources() {
    appLocator.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    );

    appLocator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        firebaseAuth: _firebaseAuth,
        database: _realtimeDatabase,
        googleSignIn: appLocator.get<GoogleSignIn>(),
      ),
    );

    appLocator.registerLazySingleton<UserRepositoryImpl>(
      () => UserRepositoryImpl(
        authProvider: appLocator.get<AuthProvider>(),
      ),
    );

    appLocator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        userRepository: appLocator.get<UserRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        userRepository: appLocator.get<UserRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        userRepository: appLocator.get<UserRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(
        userRepository: appLocator.get<UserRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<CheckAuthenticationStatusUseCase>(
      () => CheckAuthenticationStatusUseCase(
        userRepository: appLocator.get<UserRepositoryImpl>(),
      ),
    );
  }

  // -----------------------------------------------------------

  // initialization Hive
  // -----------------------------------------------------------
  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(CartAdapter());
    Hive.registerAdapter(CartProductAdapter());
    Hive.registerAdapter(OrderAdapter());
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

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<GetAllCartUseCase>(
      () => GetAllCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<AddProductInCartUseCase>(
      () => AddProductInCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<DeleteProductFromCartUseCase>(
      () => DeleteProductFromCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
  }

  // -----------------------------------------------------------

  // initialization order resources
  // -----------------------------------------------------------
  void _initOrders() {
    appLocator.registerLazySingleton<OrderRepositoryImpl>(
      () => OrderRepositoryImpl(
        firebaseProvider: appLocator.get<FirebaseProvider>(),
      ),
    );

    appLocator.registerLazySingleton<GetOrdersUseCase>(
      () => GetOrdersUseCase(
        orderRepository: appLocator.get<OrderRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<AddOrderUseCase>(
      () => AddOrderUseCase(
        orderRepository: appLocator.get<OrderRepositoryImpl>(),
      ),
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

    appLocator.registerLazySingleton<GetFontSizeUseCase>(
      () => GetFontSizeUseCase(
        preferencesRepository: appLocator.get<PreferencesRepositoryImpl>(),
      ),
    );

    appLocator.registerLazySingleton<SetFontSizeUseCase>(
      () => SetFontSizeUseCase(
        preferencesRepository: appLocator.get<PreferencesRepositoryImpl>(),
      ),
    );
  }

// -----------------------------------------------------------
}
