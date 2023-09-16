import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:auth/auth.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  @override
  final Size preferredSize;

  const HomeAppBar({
    Key? key,
    required this.title,
    this.leading,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return AppBar(
          title: Text(
            title,
            style: TextStyle(
              fontSize: state.appTheme.textTheme.titleLarge!.fontSize,
            ),
          ),
          centerTitle: true,
          leading: leading,
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
