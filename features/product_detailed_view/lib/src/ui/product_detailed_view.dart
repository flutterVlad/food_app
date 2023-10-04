import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;

  const ProductDetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = model.ingredients;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return Scaffold(
          appBar: HomeAppBar(
            title: 'Details',
            leading: AutoLeadingButton(
              color: themeState.appTheme.secondaryHeaderColor,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: themeState.appTheme.primaryColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color:
                              themeState.appTheme.primaryColor.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: CachedImage(
                      imageUrl: model.imageUrl,
                    ),
                  ),
                  Text(
                    model.name,
                    style: themeState.appTheme.textTheme.titleLarge,
                  ),
                  GradientBlock(
                    gradient: themeState.gradient,
                    child: Text(
                      '\$${model.price}',
                      style: themeState.appTheme.textTheme.titleLarge,
                    ),
                  ),
                  const Divider(),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      model.description,
                      style: themeState.appTheme.textTheme.titleSmall,
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
                          gradient: themeState.gradient,
                          child: const Icon(Icons.double_arrow_sharp),
                        ),
                        title: Text(
                          ingredients[index],
                          style: themeState.appTheme.textTheme.titleSmall,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
