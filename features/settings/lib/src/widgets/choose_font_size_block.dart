import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:settings/src/bloc/theme_bloc.dart';

class ChoiceRow extends StatefulWidget {
  const ChoiceRow({Key? key}) : super(key: key);

  @override
  State<ChoiceRow> createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {
  final List<String> titles = ThemeState.cardSize.keys.toList();
  static const List<double> titleSize = [17, 22, 27];

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    String dropdownValue = themeBloc.state.sizeData;
    Color textColor = themeBloc.state.appTheme.secondaryHeaderColor;

    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (BuildContext context, ThemeState state) {
        textColor = themeBloc.state.appTheme.secondaryHeaderColor;
      },
      builder: (BuildContext context, ThemeState state) {
        return DropdownButton<String>(
          underline: Container(),
          value: dropdownValue,
          onChanged: (String? value) {
            setState(
                  () {
                dropdownValue = value!;
                themeBloc.add(SizeSwitchEvent(sizeData: dropdownValue));
              },
            );
          },
          items: <DropdownMenuItem<String>>[
            ...List.generate(
              titles.length,
                  (index) =>
                  DropdownMenuItem<String>(
                    value: titles[index],
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: titleSize[index],
                        color: textColor,
                      ),
                    ),
                  ),
            )
          ],
        );
      },
    );
  }
}
