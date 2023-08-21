import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:home/src/widgets/card_button.dart';
import 'package:core_ui/core_ui.dart';

class HomeCard extends StatefulWidget {
  final ProductModel model;

  const HomeCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(HomeCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedImage(
              imageUrl: widget.model.imageUrl,
            ),
            Text(
              widget.model.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$${widget.model.price}',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                  ),
                ),
                CardButton(
                  model: widget.model,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
