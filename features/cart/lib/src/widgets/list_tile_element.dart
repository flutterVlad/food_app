import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';
import 'package:cart/src/bloc/cart_bloc.dart';

class ListTileElement extends StatelessWidget {
  final ProductModel model;
  final int quantity;
  final VoidCallback onTap;

  const ListTileElement({
    Key? key,
    required this.model,
    required this.quantity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;

    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.name,
              style: themeState.appTheme.textTheme.titleMedium,
            ),
            Row(
              children: <Widget>[
                GradientBlock(
                  gradient: themeState.gradient,
                  child: IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              RemoveProductEvent(model: model),
                            );
                      },
                      icon: const Icon(Icons.remove)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: themeState.appTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$quantity',
                    style: themeState.appTheme.textTheme.titleSmall,
                  ),
                ),
                GradientBlock(
                  gradient: themeState.gradient,
                  child: IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              AddProductEvent(model: model),
                            );
                      },
                      icon: const Icon(Icons.add)),
                ),
              ],
            ),
          ],
        ),
        leading: Hero(
          tag: model.imageUrl,
          child: CachedImage(
            imageUrl: model.imageUrl,
          ),
        ),
        trailing: GradientBlock(
          gradient: themeState.gradient,
          child: Text(
            '\$${model.price}',
            style: themeState.appTheme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
