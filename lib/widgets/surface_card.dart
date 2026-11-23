import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(22),
    this.color = AppColors.surface,
    this.borderColor = AppColors.outline,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }
}
