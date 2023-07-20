import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/bloc/theme_bloc.dart';
import 'package:settings/src/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Light Mode',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (BuildContext context, ThemeState state) {
                      return Switch(
                        value: state.switchState,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Font Size',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const ChoiceRow(),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
