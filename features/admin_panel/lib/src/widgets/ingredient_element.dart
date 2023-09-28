import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'ingredient_card.dart';
import 'package:admin_panel/admin_panel.dart';

class Ingredients extends StatelessWidget {
  final TextEditingController ingredientController;

  const Ingredients({
    super.key,
    required this.ingredientController,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

    return BlocBuilder<AdminBloc, AdminState>(
      builder: (_, AdminState adminState) {
        return Column(
          children: <Widget>[
            Text(
              'Ingredients',
              style: theme.textTheme.titleMedium,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Add ingredient',
                    ),
                    controller: ingredientController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppAnimatedButton(
                    onTap: () {
                      if (ingredientController.text.isNotEmpty) {
                        adminBloc.add(
                          AddIngredientEvent(
                            ingredient: ingredientController.text,
                          ),
                        );
                      }
                      ingredientController.clear();
                    },
                    child: Icon(
                      Icons.add,
                      color: theme.secondaryHeaderColor,
                    ),
                  ),
                )
              ],
            ),
            adminState.ingredients.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: theme.primaryColor.withOpacity(0.5),
                    ),
                    child: Column(
                      children: <Widget>[
                        ...List.generate(
                          adminState.ingredients.length,
                          (int index) {
                            return IngredientCard(
                              title: adminState.ingredients[index],
                              onTap: () {
                                adminBloc.add(
                                  RemoveIngredientEvent(index: index),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
