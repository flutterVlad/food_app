import 'package:flutter/material.dart';
import '../../navigation.dart';

class EntryPointScreenTemplate extends StatelessWidget {
  final List<PageRouteInfo> routes;
  final Widget Function(BuildContext, TabsRouter) bottomNavigationBuilder;

  const EntryPointScreenTemplate({
    super.key,
    required this.routes,
    required this.bottomNavigationBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.linear,
      builder: (_, Widget? child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation.drive(
            Tween<double>(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      routes: routes,
      bottomNavigationBuilder: bottomNavigationBuilder,
    );
  }
}
