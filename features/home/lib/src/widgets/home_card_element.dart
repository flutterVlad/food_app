import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:cart/cart.dart';
import 'package:core_ui/core_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCard extends StatelessWidget {
  final ProductModel model;
  final VoidCallback onTap;

  const HomeCard({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedImage(
              imageUrl: model.imageUrl,
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
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Container(
                      width: media.size.width * 0.08,
                      height: media.size.width * 0.08,
                      decoration: BoxDecoration(
                        gradient: state.gradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context).add(
                            AddProductEvent(model: model),
                          );
                        },
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
