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
    EntryPointRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EntryPointScreen(),
      );
    },
    ProductsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => ProductDetailRouteArgs(model: pathParams.get('model')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ProductDetailsScreen(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          EntryPointRoute.name,
          path: '/',
          children: [
            RouteConfig(
              ProductsRoute.name,
              path: 'products',
              parent: EntryPointRoute.name,
              children: [
                RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: ProductsRoute.name,
                ),
                RouteConfig(
                  ProductDetailRoute.name,
                  path: ':model',
                  parent: ProductsRoute.name,
                ),
              ],
            ),
            RouteConfig(
              OrderHistoryRoute.name,
              path: 'order_history',
              parent: EntryPointRoute.name,
            ),
            RouteConfig(
              CartRoute.name,
              path: 'cart',
              parent: EntryPointRoute.name,
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: EntryPointRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [EntryPointScreen]
class EntryPointRoute extends PageRouteInfo<void> {
  const EntryPointRoute({List<PageRouteInfo>? children})
      : super(
          EntryPointRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EntryPointRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          path: 'products',
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
          path: 'order_history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: 'cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
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
    required dynamic model,
  }) : super(
          ProductDetailRoute.name,
          path: ':model',
          args: ProductDetailRouteArgs(
            key: key,
            model: model,
          ),
          rawPathParams: {'model': model},
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final dynamic model;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, model: $model}';
  }
}
