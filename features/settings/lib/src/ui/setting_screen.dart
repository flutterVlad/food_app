import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/bloc/theme_bloc.dart';

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
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (BuildContext context, ThemeState state) {
                  return Switch(
                    value: state is LightThemeState,
                    onChanged: (_) {
                      BlocProvider.of<ThemeBloc>(context).add(
                        ThemeSwitchEvent(),
                      );
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
