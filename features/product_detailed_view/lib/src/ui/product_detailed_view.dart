import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;

  const ProductDetailsScreen({
    Key? key,
    @PathParam('model') required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = model.ingredients;
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        final Color containerColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: ingredients.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: containerColor,
                          boxShadow: [
                            BoxShadow(
                              color: containerColor.withOpacity(0.5),
                              spreadRadius: 7,
                              blurRadius: 7,
                            ),
                          ]),
                      child: Image.network(model.imageUrl),
                    ),
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GradientWidget(
                      gradient: state == AppTheme.getDarkThemeData()
                          ? AppDarkThemeColors.gradient
                          : AppLightThemeColors.gradient,
                      child: Text(
                        '\$${model.price}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const Divider(),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Text(
                        model.description,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const Divider(),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                );
              } else {
                return ListTile(
                  leading: GradientWidget(
                    gradient: state == AppTheme.getDarkThemeData()
                        ? AppDarkThemeColors.gradient
                        : AppLightThemeColors.gradient,
                    child: const Icon(Icons.double_arrow_sharp),
                  ),
                  title: Text(
                    ingredients[index - 1],
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
