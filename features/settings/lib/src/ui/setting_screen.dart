import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/bloc/bloc.dart';
import 'package:core_ui/core_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Light Mode',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              BlocBuilder<ThemeBloc, ThemeData>(
                builder: (BuildContext context, ThemeData state) {
                  return Switch(
                    value: state == AppTheme.getLightThemeData(),
                    onChanged: (bool val) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeSwitchEvent());
                    },
                  );
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
