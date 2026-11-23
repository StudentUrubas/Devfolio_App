import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/portfolio_project.dart';
import '../theme/app_theme.dart';
import 'section_header.dart';
import 'surface_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionHeader(
        eyebrow: 'Ferramentas',
        title: 'Habilidades e tecnologias',
        description: 'Níveis ilustrativos que você pode editar no arquivo de dados.',
      ),
      const SizedBox(height: 20),
      SurfaceCard(
        child: LayoutBuilder(builder: (context, constraints) {
          final columns = constraints.maxWidth >= 680 ? 2 : 1;
          const spacing = 28.0;
          final width = (constraints.maxWidth - (columns - 1) * spacing) / columns;
          return Wrap(
            spacing: spacing,
            runSpacing: 26,
            children: PortfolioData.skills.map((skill) => SizedBox(
              width: width,
              child: _SkillProgress(skill: skill),
            )).toList(),
          );
        }),
      ),
    ]);
  }
}

class _SkillProgress extends StatelessWidget {
  const _SkillProgress({required this.skill});

  final SkillItem skill;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(skill.icon, color: skill.color, size: 17),
        const SizedBox(width: 8),
        Expanded(child: Text(skill.name, style: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700,
        ))),
        Text('${(skill.level * 100).round()}%', style: const TextStyle(
          color: AppColors.muted, fontSize: 11, fontWeight: FontWeight.w700,
        )),
      ]),
      const SizedBox(height: 11),
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: LinearProgressIndicator(
          value: skill.level.clamp(0.0, 1.0).toDouble(),
          minHeight: 7,
          backgroundColor: AppColors.surfaceLight,
          valueColor: AlwaysStoppedAnimation<Color>(skill.color),
        ),
      ),
    ]);
  }
}
