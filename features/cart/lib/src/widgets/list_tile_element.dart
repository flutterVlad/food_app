import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';
import 'package:cart/src/bloc/bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:navigation/navigation.dart';

class ListTileElement extends StatelessWidget {
  final ProductModel model;
  final int quantity;

  const ListTileElement({
    Key? key,
    required this.model,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          ProductDetailRoute(model: model),
        );
      },
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: <Widget>[
                GradientBlock(
                  gradient: BlocProvider.of<ThemeBloc>(context).state.gradient,
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(
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
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                GradientBlock(
                  gradient: BlocProvider.of<ThemeBloc>(context).state.gradient,
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(
                          AddProductEvent(model: model),
                        );
                      },
                      icon: const Icon(Icons.add)),
                ),
              ],
            )
          ],
        ),
        leading: Image.network(model.imageUrl),
        trailing: GradientBlock(
          gradient: BlocProvider.of<ThemeBloc>(context).state.gradient,
          child: Text(
            '\$${model.price}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
