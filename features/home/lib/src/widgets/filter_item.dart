import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const FilterItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: themeState.appTheme.primaryColor.withOpacity(1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: widget.isActive
                  ? themeState.appTheme.secondaryHeaderColor.withOpacity(0.5)
                  : themeState.appTheme.primaryColor.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isActive
                ? themeState.appTheme.secondaryHeaderColor
                : themeState.appTheme.textTheme.titleMedium!.color,
            fontSize: themeState.appTheme.textTheme.titleMedium!.fontSize,
          ),
        ),
      ),
    );
  }
}
