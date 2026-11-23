import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class IntroBanner extends StatelessWidget {
  const IntroBanner({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 290),
      padding: const EdgeInsets.all(27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.accent.withAlpha(59)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D403D), Color(0xFF142B34), Color(0xFF142137)],
        ),
      ),
      child: Stack(children: [
        const Positioned(
          top: -34,
          right: -35,
          child: IgnorePointer(child: Icon(Icons.blur_on_rounded,
              size: 220, color: Color(0x173BFFB8))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(31),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.accent.withAlpha(64)),
              ),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.circle, color: AppColors.accent, size: 8),
                SizedBox(width: 8),
                Text('PORTFÓLIO DE DESENVOLVIMENTO', style: TextStyle(
                  color: AppColors.accent, fontSize: 10, letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                )),
              ]),
            ),
            const SizedBox(height: 22),
            const Text('Código, criatividade\ne evolução.',
                style: TextStyle(fontSize: 31, height: 1.11,
                    fontWeight: FontWeight.w900, letterSpacing: -1.2)),
            const SizedBox(height: 12),
            const Text(
              'Um lugar para apresentar meus projetos, habilidades e conquistas.',
              style: TextStyle(color: Color(0xFFC3D5DF), fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 21),
            FilledButton.icon(
              onPressed: onExplore,
              icon: const Icon(Icons.arrow_forward_rounded, size: 18),
              label: const Text('Explorar projetos'),
            ),
          ],
        ),
      ]),
    );
  }
}
