import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
    this.trailing,
  });

  final String eyebrow;
  final String title;
  final String description;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 12,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eyebrow.toUpperCase(), style: const TextStyle(
              color: AppColors.accent, fontSize: 11,
              fontWeight: FontWeight.w800, letterSpacing: 1.8,
            )),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -.7,
            )),
            const SizedBox(height: 7),
            Text(description, style: const TextStyle(
              color: AppColors.muted, fontSize: 13, height: 1.5,
            )),
          ],
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
