import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/bloc/theme_bloc.dart';
import 'package:settings/src/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: const HomeAppBar(title: 'Settings'),
      body: BlocBuilder<ThemeBloc, ThemeState>(
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
                      style: theme.textTheme.titleMedium,
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
                      style: theme.textTheme.titleMedium,
                    ),
                    const ChoiceRow(),
                  ],
                ),
                const Divider(),
                Center(
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse('https://innowise-group.com/')),
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.secondaryHeaderColor,
                        color: theme.secondaryHeaderColor,
                        fontSize: theme.textTheme.titleMedium!.fontSize,
                      ),
                    ),
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
