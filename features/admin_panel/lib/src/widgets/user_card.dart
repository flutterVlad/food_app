import 'package:admin_panel/admin_panel.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';
import 'package:core/core.dart';

import 'action_button.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: user.role == 'admin'
                    ? Icon(
                        Icons.manage_accounts,
                        color: themeState.appTheme.secondaryHeaderColor,
                      )
                    : const Icon(Icons.account_circle),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  '${user.userName} - ${user.email}',
                  style: themeState.appTheme.textTheme.titleMedium,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: user.role,
                    borderRadius: BorderRadius.circular(15),
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        value: UserRoles.user.name,
                        child: Text(
                          UserRoles.user.name,
                          style: themeState.appTheme.textTheme.titleMedium,
                        ),
                      ),
                      DropdownMenuItem(
                        value: UserRoles.admin.name,
                        child: Text(
                          UserRoles.admin.name,
                          style: themeState.appTheme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                    onChanged: (String? newRole) {
                      adminBloc.add(
                        UpdateUserRoleEvent(
                          user: user.copyWith(role: newRole),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
