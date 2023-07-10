import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:cart/cart.dart';
import 'package:navigation/src/entry_point/entry_point.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:product_detailed_view/product_detailed_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: EntryPointScreen,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          path: 'products',
          name: 'ProductsRoute',
          page: EmptyRouterPage,
          children: <AutoRoute>[
            AutoRoute(
              path: '',
              name: 'HomeRoute',
              page: HomeScreen,
            ),
            CustomRoute(
              path: ':model',
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: 'order_history',
          name: 'OrderHistoryRoute',
          page: OrderHistoryScreen,
        ),
        AutoRoute(
          path: 'cart',
          name: 'EmptyCartRoute',
          page: EmptyRouterPage,
          children: <AutoRoute>[
            AutoRoute(
              path: '',
              name: 'CartRoute',
              page: CartScreen,
            ),
            CustomRoute(
              path: ':model',
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRoute',
          page: SettingsScreen,
        )
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
