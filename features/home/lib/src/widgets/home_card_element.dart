import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

class HomeCard extends StatelessWidget {
  final ProductModel model;

  const HomeCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          ProductDetailRoute(model: model),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: int.parse("${MediaQuery.of(context).size.width.round()}") * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRect(
              child: Image.network(model.imageUrl),
            ),
            Text(
              model.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$${model.price}',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                BlocBuilder<ThemeBloc, ThemeData>(
                  builder: (context, state) {
                    return Container(
                      width: int.parse(
                              '${MediaQuery.of(context).size.width.round()}') *
                          0.08,
                      height: int.parse(
                              '${MediaQuery.of(context).size.width.round()}') *
                          0.08,
                      decoration: BoxDecoration(
                        gradient: state == AppTheme.getLightThemeData()
                            ? AppLightThemeColors.gradient
                            : AppDarkThemeColors.gradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
