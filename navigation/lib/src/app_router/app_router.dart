import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:cart/cart.dart';
import 'package:navigation/src/entry_point/entry_point.dart';
import 'package:navigation/src/entry_point/admin_entry_point.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:product_detailed_view/product_detailed_view.dart';
import 'package:auth/auth.dart';
import 'package:admin_panel/admin_panel.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: StartAuthScreen,
      initial: true,
    ),
    AutoRoute(
      page: AdminEntryPointScreen,
      children: <AutoRoute>[
        AutoRoute(
          name: 'EmptyAdminProductRoute',
          initial: true,
          page: HeroEmptyRouterPage,
          children: <AutoRoute>[
            AutoRoute(
              name: 'AdminProductsRoute',
              initial: true,
              page: AdminProductsScreen,
            ),
            AutoRoute(
              name: 'EditRoute',
              page: EditProductScreen,
            ),
          ],
        ),
        AutoRoute(
          name: 'AdminOrdersRoute',
          page: AdminOrdersScreen,
        ),
        AutoRoute(
          name: 'AdminUsersRoute',
          page: AdminUsersScreen,
        ),
        AutoRoute(
          name: 'SettingsRoute',
          page: SettingsScreen,
        ),
      ],
    ),
    AutoRoute(
      page: EntryPointScreen,
      children: <AutoRoute>[
        AutoRoute(
          name: 'ProductsRoute',
          page: HeroEmptyRouterPage,
          initial: true,
          children: <AutoRoute>[
            AutoRoute(
              name: 'HomeRoute',
              page: HomeScreen,
              initial: true,
            ),
            AutoRoute(
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
            ),
          ],
        ),
        AutoRoute(
          name: 'OrderHistoryRoute',
          page: OrderHistoryScreen,
        ),
        AutoRoute(
          name: 'EmptyCartRoute',
          page: HeroEmptyRouterPage,
          children: <AutoRoute>[
            AutoRoute(
              name: 'CartRoute',
              page: CartScreen,
              initial: true,
            ),
            AutoRoute(
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
            ),
          ],
        ),
        AutoRoute(
          name: 'SettingsRoute',
          page: SettingsScreen,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}
