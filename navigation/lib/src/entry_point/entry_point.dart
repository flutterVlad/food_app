import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:navigation/src/entry_point/entry_point_template.dart';
import '../../navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:settings/settings.dart';
import 'package:badges/badges.dart' as badges;

class EntryPointScreen extends StatelessWidget {
  const EntryPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return EntryPointScreenTemplate(
          routes: const <PageRouteInfo>[
            ProductsRoute(),
            OrderHistoryRoute(),
            EmptyCartRoute(),
            SettingsRoute(),
          ],
          bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
            return BlocBuilder<CartBloc, CartState>(
              builder: (_, CartState cartState) {
                return GNav(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  backgroundColor: themeState.appTheme.primaryColor,
                  selectedIndex: tabsRouter.activeIndex,
                  onTabChange: tabsRouter.setActiveIndex,
                  tabMargin: const EdgeInsets.all(8),
                  tabActiveBorder: Border.all(
                    color: themeState.appTheme.secondaryHeaderColor,
                  ),
                  textStyle: themeState.appTheme.textTheme.titleSmall,
                  gap: 8,
                  tabs: <GButton>[
                    const GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    const GButton(
                      icon: Icons.history,
                      text: 'Order history',
                    ),
                    GButton(
                      icon: Icons.shopping_cart_rounded,
                      text: 'Cart',
                      leading: cartState.countCartProducts != 0
                          ? badges.Badge(
                              position: badges.BadgePosition.topEnd(
                                top: -8,
                                end: -8,
                              ),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                cartState.countCartProducts.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              badgeAnimation:
                                  const badges.BadgeAnimation.rotation(
                                animationDuration: Duration(milliseconds: 500),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor:
                                    themeState.appTheme.secondaryHeaderColor,
                                padding: const EdgeInsets.all(5),
                                elevation: 0,
                              ),
                              child: const Icon(
                                Icons.shopping_cart_rounded,
                              ),
                            )
                          : null,
                    ),
                    const GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
