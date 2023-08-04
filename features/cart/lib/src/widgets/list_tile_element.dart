import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';
import 'package:cart/src/bloc/cart_bloc.dart';

class ListTileElement extends StatefulWidget {
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
  State<ListTileElement> createState() => _ListTileElementState();
}

class _ListTileElementState extends State<ListTileElement>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeState themeState = BlocProvider.of<ThemeBloc>(context).state;
    final CartState cartState = BlocProvider.of<CartBloc>(context).state;

    return GestureDetector(
      onTap: widget.onTap,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.model.name,
              style: themeState.appTheme.textTheme.titleMedium,
            ),
            Row(
              children: <Widget>[
                GradientBlock(
                  gradient: themeState.gradient,
                  child: IconButton(
                      onPressed: () {
                        _controller.reset();
                        _controller.forward();
                        context.read<CartBloc>().add(
                              RemoveProductEvent(model: widget.model),
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
                    '${widget.quantity}',
                    style: themeState.appTheme.textTheme.titleSmall,
                  ),
                ),
                GradientBlock(
                  gradient: themeState.gradient,
                  child: IconButton(
                      onPressed: () {
                        _controller.reset();
                        _controller.forward();
                        context.read<CartBloc>().add(
                              AddProductEvent(model: widget.model),
                            );
                      },
                      icon: const Icon(Icons.add)),
                ),
              ],
            ),
          ],
        ),
        leading: Hero(
          tag: widget.model.imageUrl,
          child: CachedImage(
            imageUrl: widget.model.imageUrl,
          ),
        ),
        trailing: GradientBlock(
          gradient: themeState.gradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Text(
                  '\$${widget.model.price}',
                  style: themeState.appTheme.textTheme.titleMedium,
                ),
              ),
              if (widget.quantity != 1)
                Expanded(
                  flex: 8,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Text(
                      '\$${cartState.getAmountOfOneProduct(
                        double.parse(widget.model.price),
                        widget.quantity,
                      )}',
                      style: themeState.appTheme.textTheme.titleSmall,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
