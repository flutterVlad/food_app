import 'package:auto_route/auto_route.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:cart/cart.dart';
import 'package:navigation/src/entry_point/entry_point.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:product_detailed_view/product_detailed_view.dart';
import 'package:auth/src/ui/sign_in_screen.dart';
import 'package:auth/auth.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/signIn', page: SignInScreen, initial: true),
    AutoRoute(path: '/signUp', page: SignUpScreen),
    AutoRoute(
      path: '',
      page: EntryPointScreen,
      children: <AutoRoute>[
        CustomRoute(
          name: 'ProductsRoute',
          page: HeroEmptyRouterPage,
          initial: true,
          children: <AutoRoute>[
            CustomRoute(
              name: 'HomeRoute',
              page: HomeScreen,
              initial: true,
            ),
            CustomRoute(
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            ),
          ],
        ),
        AutoRoute(
          name: 'OrderHistoryRoute',
          page: OrderHistoryScreen,
        ),
        CustomRoute(
          name: 'EmptyCartRoute',
          page: HeroEmptyRouterPage,
          children: <AutoRoute>[
            CustomRoute(
              name: 'CartRoute',
              page: CartScreen,
              initial: true,
            ),
            CustomRoute(
              name: 'ProductDetailRoute',
              page: ProductDetailsScreen,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade,
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
