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

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return DropdownButton<String>(
          underline: Container(),
          value: state.sizeData,
          onChanged: (String? value) {
            themeBloc.add(SizeSwitchEvent(sizeData: value!));
          },
          items: <DropdownMenuItem<String>>[
            ...List.generate(
              titles.length,
              (index) => DropdownMenuItem<String>(
                value: titles[index],
                child: Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: titleSize[index],
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
