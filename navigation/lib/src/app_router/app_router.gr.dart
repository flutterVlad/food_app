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
    EntryPointRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EntryPointScreen(),
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
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
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
