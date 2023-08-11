import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home/home.dart';
import 'filter_item.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    final List<String> categories = productBloc.state.categories;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Popular Items',
              style: TextStyle(
                fontSize: theme.textTheme.titleLarge!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                productBloc.add(
                  ShowAllProductsEvent(),
                );
              },
              child: Text(
                'View all',
                style: TextStyle(
                  color: theme.secondaryHeaderColor,
                  fontSize: theme.textTheme.titleMedium!.fontSize,
                ),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categories.map(
              (category) {
                return Expanded(
                  flex: 0,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: FilterItem(
                      title: category,
                      onTap: () {
                        productBloc.add(
                          FilterByCategoryEvent(
                            category: category,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
