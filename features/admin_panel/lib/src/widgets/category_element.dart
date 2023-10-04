import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/admin_panel.dart';

class CategoriesElement extends StatelessWidget {
  const CategoriesElement({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminBloc adminBloc = BlocProvider.of<AdminBloc>(context);

    return BlocBuilder<AdminBloc, AdminState>(
      builder: (_, AdminState adminState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              Text(
                'Category',
                style: theme.textTheme.titleMedium,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(15),
                      isExpanded: true,
                      onChanged: (String? value) {
                        adminBloc.add(
                          ChooseCategoryEvent(category: value ?? ''),
                        );
                      },
                      value: adminState.selectedCategory,
                      items: <DropdownMenuItem<String>>[
                        ...List.generate(
                          adminState.categories.length,
                          (int index) => DropdownMenuItem<String>(
                            value: adminState.categories[index],
                            child: Text(
                              adminState.categories[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AppAnimatedButton(
                      onTap: () {
                        showAddCategoryDialog(context: context);
                      },
                      child: Icon(
                        Icons.add,
                        color: theme.secondaryHeaderColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> showAddCategoryDialog({
    required BuildContext context,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);
        final TextEditingController controller = TextEditingController();

        return AlertDialog(
          content: TextField(
            controller: controller,
            style: theme.textTheme.titleMedium,
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: theme.textTheme.titleMedium!.fontSize,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<AdminBloc>(context).add(
                  AddCategoryEvent(
                    categoryName: controller.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: theme.textTheme.titleMedium!.fontSize,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
