import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';
import 'package:cart/cart.dart';

class CardButton extends StatefulWidget {
  final ProductModel model;

  const CardButton({
    super.key,
    required this.model,
  });

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    )..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          }
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, ThemeState themeState) {
        return ScaleTransition(
          scale: _animation,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CartBloc>(context).add(
                AddProductEvent(productModel: widget.model),
              );
              setState(() {
                _controller.forward();
              });
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: themeState.gradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add,
                fill: 1,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
