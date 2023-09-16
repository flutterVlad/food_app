import 'package:flutter/material.dart';
import 'ingredient_card.dart';
import 'package:admin_panel/admin_panel.dart';

class Ingredients extends StatelessWidget {
  final TextEditingController _ingredientController;

  const Ingredients({
    super.key,
    required TextEditingController ingredientController,
  }) : _ingredientController = ingredientController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (_, AdminState adminState) {
        return Column(
          children: <Widget>[
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Add ingredient',
              ),
              controller: _ingredientController,
              onFieldSubmitted: (String? value) {
                _ingredientController.clear();
                BlocProvider.of<AdminBloc>(context).add(
                  AddIngredientEvent(ingredient: value ?? ''),
                );
              },
            ),
            adminState.ingredients.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    child: Column(
                      children: <Widget>[
                        ...List.generate(
                          adminState.ingredients.length,
                          (int index) {
                            return IngredientCard(
                              title: adminState.ingredients[index],
                              onTap: () {
                                BlocProvider.of<AdminBloc>(context).add(
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
