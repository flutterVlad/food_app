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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Image.network(model.imageUrl),
                ),
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GradientBlock(
                  gradient: state.gradient,
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: GradientBlock(
                        gradient: state.gradient,
                        child: const Icon(Icons.double_arrow_sharp),
                      ),
                      title: Text(
                        ingredients[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
