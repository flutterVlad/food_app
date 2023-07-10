import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import '../../navigation.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPointScreen extends StatelessWidget {
  const EntryPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ProductsRoute(),
        OrderHistoryRoute(),
        EmptyCartRoute(),
        SettingsRoute(),
      ],
      appBarBuilder: (_, tabsRouter) {
        return const HomeAppBar();
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Order history',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    children: <Widget>[
                      const Icon(Icons.shopping_cart_rounded),
                      if (state.countCartProducts != 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.width * 0.03,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(1),
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                state.countCartProducts.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
            );
          },
        );
      },
    );
  }
}
