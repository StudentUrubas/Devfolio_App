import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'surface_card.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.accent,
  });

  final String label;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(child: Text(label, style: const TextStyle(
              color: AppColors.muted, fontSize: 12, fontWeight: FontWeight.w600,
            ))),
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: accent.withAlpha(33),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: accent, size: 19),
            ),
          ]),
          const SizedBox(height: 13),
          Text(value, style: const TextStyle(
            fontSize: 31, fontWeight: FontWeight.w900, letterSpacing: -1.3,
          )),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(
            color: AppColors.muted, fontSize: 11,
          )),
        ],
      ),
    );
  }
}
