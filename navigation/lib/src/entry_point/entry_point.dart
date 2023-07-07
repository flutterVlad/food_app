import 'package:flutter/material.dart';
import '../../navigation.dart';
import 'package:core_ui/core_ui.dart';

class EntryPointScreen extends StatelessWidget {
  const EntryPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ProductsRoute(),
        OrderHistoryRoute(),
        CartRoute(),
        SettingsRoute(),
      ],
      appBarBuilder: (_, tabsRouter) {
        return const HomeAppBar();
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Order history',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
