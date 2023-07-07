import 'package:flutter/material.dart';

class GradientBlock extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;

  const GradientBlock({
    Key? key,
    required this.gradient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
