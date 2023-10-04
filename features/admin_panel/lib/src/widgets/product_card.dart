import 'package:admin_panel/src/widgets/action_button.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin_panel/admin_panel.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CachedImage(
                    imageUrl: product.imageUrl,
                  ),
                ),
                title: Text(
                  product.name,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: ActionButton(
                  onTap: () {
                    BlocProvider.of<AdminBloc>(context).add(
                      NavigateToEditEvent(
                        product: product,
                      ),
                    );
                  },
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                  ),
                  icon: const Icon(Icons.update),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: ActionButton(
                  onTap: () {
                    AppAlertDialog.showAlertDialog(
                      context: context,
                      title: 'Do you really want to delete ${product.name}?',
                      onTap: () {
                        BlocProvider.of<AdminBloc>(context).add(
                          DeleteProductEvent(
                            product: product,
                          ),
                        );
                      },
                    );
                  },
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                  ),
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
