import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_header.dart';
import 'surface_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Future<void> _copyGithub(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: PortfolioData.github));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Endereço do GitHub copiado.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionHeader(
        eyebrow: 'Quem sou',
        title: 'Um pouco sobre mim',
        description: 'Minha trajetória e formas de contato.',
      ),
      const SizedBox(height: 20),
      LayoutBuilder(builder: (context, constraints) {
        final about = SurfaceCard(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.waving_hand_outlined, color: AppColors.amber, size: 26),
            const SizedBox(height: 14),
            Text('Olá! Eu sou ${PortfolioData.name}.', style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w900,
            )),
            const SizedBox(height: 12),
            const Text(PortfolioData.about, style: TextStyle(
              fontSize: 13, height: 1.65, color: AppColors.muted,
            )),
            const SizedBox(height: 20),
            const Text('Vamos conversar?', style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w800,
            )),
            const SizedBox(height: 8),
            SelectableText(PortfolioData.email, style: const TextStyle(
              color: AppColors.accent, fontSize: 12,
            )),
            const SizedBox(height: 9),
            OutlinedButton.icon(
              onPressed: () => _copyGithub(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.foreground,
                side: const BorderSide(color: AppColors.outline),
              ),
              icon: const Icon(Icons.copy_rounded, size: 15),
              label: const Text('Copiar GitHub', style: TextStyle(fontSize: 11)),
            ),
          ],
        ));
        const activity = _ActivityTimeline();
        if (constraints.maxWidth >= 710) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(flex: 3, child: about),
            const SizedBox(width: 16),
            const Expanded(flex: 2, child: activity),
          ]);
        }
        return Column(children: [
          about,
          const SizedBox(height: 16),
          activity,
        ]);
      }),
    ]);
  }
}

class _ActivityTimeline extends StatelessWidget {
  const _ActivityTimeline();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Linha do tempo', style: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 15,
        )),
        const SizedBox(height: 6),
        const Text('Atividades de exemplo', style: TextStyle(
          color: AppColors.muted, fontSize: 11,
        )),
        const SizedBox(height: 19),
        for (final activity in PortfolioData.activities) ...[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(activity.icon, size: 17, color: AppColors.accent),
            ),
            const SizedBox(width: 11),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(activity.title, style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w800,
              )),
              const SizedBox(height: 4),
              Text(activity.subtitle, style: const TextStyle(
                fontSize: 11, color: AppColors.muted, height: 1.4,
              )),
              const SizedBox(height: 5),
              Text(activity.date, style: const TextStyle(
                fontSize: 10, color: AppColors.accent,
              )),
            ])),
          ]),
          const SizedBox(height: 18),
        ],
      ]),
    );
  }
}
