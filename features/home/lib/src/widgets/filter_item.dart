import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:home/home.dart';

class FilterItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const FilterItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          productBloc.add(
            FilterByCategoryEvent(
              category: widget.title,
            ),
          );
        } else {
          productBloc.add(
            ShowAllProductsEvent(),
          );
        }
        setState(() {
          isActive = !isActive;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: themeState.appTheme.primaryColor.withOpacity(1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isActive
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
            color: isActive
                ? themeState.appTheme.secondaryHeaderColor
                : themeState.appTheme.textTheme.titleMedium!.color,
            fontSize: themeState.appTheme.textTheme.titleMedium!.fontSize,
          ),
        ),
      ),
    );
  }
}
