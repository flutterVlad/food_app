import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import '../../navigation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'entry_point_template.dart';

class AdminEntryPointScreen extends StatelessWidget {
  const AdminEntryPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return EntryPointScreenTemplate(
          routes: const <PageRouteInfo>[
            EmptyAdminProductRoute(),
            AdminOrdersRoute(),
            AdminUsersRoute(),
            SettingsRoute(),
          ],
          bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
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
              tabs: const <GButton>[
                GButton(
                  icon: Icons.dashboard_customize_outlined,
                  text: 'Products',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'Orders',
                ),
                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Users',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            );
          },
        );
      },
    );
  }
}
