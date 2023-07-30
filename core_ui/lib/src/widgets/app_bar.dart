import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:auth/auth.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return AppBar(
          title: Text(
            ThemeState.appBarTitle[context.topRoute.name] ?? '',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            ),
          ),
          centerTitle: true,
          leading: context.router.topRoute.name == 'ProductDetailRoute'
              ? AutoLeadingButton(color: Theme.of(context).secondaryHeaderColor)
              : null,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.logout,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
