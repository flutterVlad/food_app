// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    StartAuthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StartAuthScreen(),
      );
    },
    AdminEntryPointRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminEntryPointScreen(),
      );
    },
    EntryPointRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EntryPointScreen(),
      );
    },
    EmptyAdminProductRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HeroEmptyRouterPage(),
      );
    },
    AdminOrdersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminOrdersScreen(),
      );
    },
    AdminUsersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminUsersScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    AdminProductsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminProductsScreen(),
      );
    },
    EditRoute.name: (routeData) {
      final args =
          routeData.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HeroEmptyRouterPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryScreen(),
      );
    },
    EmptyCartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HeroEmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProductDetailsScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          StartAuthRoute.name,
          path: '/',
        ),
        RouteConfig(
          AdminEntryPointRoute.name,
          path: '/admin-entry-point-screen',
          children: [
            RouteConfig(
              EmptyAdminProductRoute.name,
              path: '',
              parent: AdminEntryPointRoute.name,
              children: [
                RouteConfig(
                  AdminProductsRoute.name,
                  path: '',
                  parent: EmptyAdminProductRoute.name,
                ),
                RouteConfig(
                  EditRoute.name,
                  path: 'edit-product-screen',
                  parent: EmptyAdminProductRoute.name,
                ),
              ],
            ),
            RouteConfig(
              AdminOrdersRoute.name,
              path: 'admin-orders-screen',
              parent: AdminEntryPointRoute.name,
            ),
            RouteConfig(
              AdminUsersRoute.name,
              path: 'admin-users-screen',
              parent: AdminEntryPointRoute.name,
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings-screen',
              parent: AdminEntryPointRoute.name,
            ),
          ],
        ),
        RouteConfig(
          EntryPointRoute.name,
          path: '/entry-point-screen',
          children: [
            RouteConfig(
              ProductsRoute.name,
              path: '',
              parent: EntryPointRoute.name,
              children: [
                RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: ProductsRoute.name,
                ),
                RouteConfig(
                  ProductDetailRoute.name,
                  path: 'product-details-screen',
                  parent: ProductsRoute.name,
                ),
              ],
            ),
            RouteConfig(
              OrderHistoryRoute.name,
              path: 'order-history-screen',
              parent: EntryPointRoute.name,
            ),
            RouteConfig(
              EmptyCartRoute.name,
              path: 'hero-empty-router-page',
              parent: EntryPointRoute.name,
              children: [
                RouteConfig(
                  CartRoute.name,
                  path: '',
                  parent: EmptyCartRoute.name,
                ),
                RouteConfig(
                  ProductDetailRoute.name,
                  path: 'product-details-screen',
                  parent: EmptyCartRoute.name,
                ),
              ],
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings-screen',
              parent: EntryPointRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [StartAuthScreen]
class StartAuthRoute extends PageRouteInfo<void> {
  const StartAuthRoute()
      : super(
          StartAuthRoute.name,
          path: '/',
        );

  static const String name = 'StartAuthRoute';
}

/// generated route for
/// [AdminEntryPointScreen]
class AdminEntryPointRoute extends PageRouteInfo<void> {
  const AdminEntryPointRoute({List<PageRouteInfo>? children})
      : super(
          AdminEntryPointRoute.name,
          path: '/admin-entry-point-screen',
          initialChildren: children,
        );

  static const String name = 'AdminEntryPointRoute';
}

/// generated route for
/// [EntryPointScreen]
class EntryPointRoute extends PageRouteInfo<void> {
  const EntryPointRoute({List<PageRouteInfo>? children})
      : super(
          EntryPointRoute.name,
          path: '/entry-point-screen',
          initialChildren: children,
        );

  static const String name = 'EntryPointRoute';
}

/// generated route for
/// [HeroEmptyRouterPage]
class EmptyAdminProductRoute extends PageRouteInfo<void> {
  const EmptyAdminProductRoute({List<PageRouteInfo>? children})
      : super(
          EmptyAdminProductRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'EmptyAdminProductRoute';
}

/// generated route for
/// [AdminOrdersScreen]
class AdminOrdersRoute extends PageRouteInfo<void> {
  const AdminOrdersRoute()
      : super(
          AdminOrdersRoute.name,
          path: 'admin-orders-screen',
        );

  static const String name = 'AdminOrdersRoute';
}

/// generated route for
/// [AdminUsersScreen]
class AdminUsersRoute extends PageRouteInfo<void> {
  const AdminUsersRoute()
      : super(
          AdminUsersRoute.name,
          path: 'admin-users-screen',
        );

  static const String name = 'AdminUsersRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings-screen',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AdminProductsScreen]
class AdminProductsRoute extends PageRouteInfo<void> {
  const AdminProductsRoute()
      : super(
          AdminProductsRoute.name,
          path: '',
        );

  static const String name = 'AdminProductsRoute';
}

/// generated route for
/// [EditProductScreen]
class EditRoute extends PageRouteInfo<EditRouteArgs> {
  EditRoute({
    Key? key,
    ProductModel? product,
  }) : super(
          EditRoute.name,
          path: 'edit-product-screen',
          args: EditRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'EditRoute';
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    this.product,
  });

  final Key? key;

  final ProductModel? product;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [HeroEmptyRouterPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';
}

/// generated route for
/// [OrderHistoryScreen]
class OrderHistoryRoute extends PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: 'order-history-screen',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [HeroEmptyRouterPage]
class EmptyCartRoute extends PageRouteInfo<void> {
  const EmptyCartRoute({List<PageRouteInfo>? children})
      : super(
          EmptyCartRoute.name,
          path: 'hero-empty-router-page',
          initialChildren: children,
        );

  static const String name = 'EmptyCartRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required ProductModel model,
  }) : super(
          ProductDetailRoute.name,
          path: 'product-details-screen',
          args: ProductDetailRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final ProductModel model;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '',
        );

  static const String name = 'CartRoute';
}
