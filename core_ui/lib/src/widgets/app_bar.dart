import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  static const Map<String, String> appBarTitle = {
    'HomeRoute': 'Products',
    'OrderHistoryRoute': 'Order History',
    'CartRoute': 'Your Cart',
    'SettingsRoute': 'Settings',
    'ProductDetailRoute': 'Details'
  };

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle[context.topRoute.name] ?? ''),
      centerTitle: true,
      leading: AutoLeadingButton(
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
