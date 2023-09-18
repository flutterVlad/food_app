import 'package:admin_panel/src/widgets/user_card.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/admin_bloc.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

    return Scaffold(
      appBar: const HomeAppBar(title: 'Admin users'),
      body: RefreshIndicator(
        color: Theme.of(context).secondaryHeaderColor,
        onRefresh: () async {
          adminBloc.add(InitUsersEvent());
        },
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (_, AdminState adminState) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: adminState.users.length,
                    itemBuilder: (_, int index) {
                      return UserCard(
                        user: adminState.users[index],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
