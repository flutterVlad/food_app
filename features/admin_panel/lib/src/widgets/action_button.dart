import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final BorderRadiusGeometry borderRadius;
  final Widget icon;
  final Color color;
  final Function() onTap;

  const ActionButton({
    super.key,
    required this.borderRadius,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
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
      end: 1.1,
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
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
          setState(() {
            _controller.forward();
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.8),
            borderRadius: widget.borderRadius,
          ),
          child: widget.icon,
        ),
      ),
    );
  }
}
