import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'metric_card.dart';
import 'section_header.dart';
import 'surface_card.dart';
import 'visits_chart.dart';

class MetricDashboard extends StatelessWidget {
  const MetricDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = <Widget>[
      MetricCard(
        label: 'Projetos no portfólio',
        value: '${PortfolioData.totalProjects}'.padLeft(2, '0'),
        subtitle: 'Total cadastrado',
        icon: Icons.folder_copy_outlined,
        accent: AppColors.blue,
      ),
      MetricCard(
        label: 'Projetos entregues',
        value: '${PortfolioData.completedProjects}'.padLeft(2, '0'),
        subtitle: 'Finalizados',
        icon: Icons.check_circle_outline_rounded,
        accent: AppColors.accent,
      ),
      MetricCard(
        label: 'Em desenvolvimento',
        value: '${PortfolioData.activeProjects}'.padLeft(2, '0'),
        subtitle: 'Em andamento',
        icon: Icons.bolt_outlined,
        accent: AppColors.amber,
      ),
      MetricCard(
        label: 'Habilidades',
        value: '${PortfolioData.totalSkills}'.padLeft(2, '0'),
        subtitle: 'Áreas de conhecimento',
        icon: Icons.auto_awesome_outlined,
        accent: AppColors.purple,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Visão geral',
          title: 'Dashboard de métricas',
          description: 'Indicadores gerados a partir dos projetos de exemplo.',
        ),
        const SizedBox(height: 22),
        LayoutBuilder(builder: (context, constraints) {
          final columns = constraints.maxWidth >= 900
              ? 4 : constraints.maxWidth >= 510 ? 2 : 1;
          const spacing = 14.0;
          final cardWidth = (constraints.maxWidth - (columns - 1) * spacing) / columns;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: stats.map((card) => SizedBox(width: cardWidth, child: card)).toList(),
          );
        }),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth >= 710) {
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: VisitsChart()),
                SizedBox(width: 16),
                Expanded(flex: 2, child: _ProjectProgressCard()),
              ],
            );
          }
          return const Column(children: [
            VisitsChart(),
            SizedBox(height: 16),
            _ProjectProgressCard(),
          ]);
        }),
      ],
    );
  }
}

class _ProjectProgressCard extends StatelessWidget {
  const _ProjectProgressCard();

  @override
  Widget build(BuildContext context) {
    final rate = PortfolioData.completionRate;

    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Status dos projetos', style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w800,
          )),
          const SizedBox(height: 6),
          const Text('Distribuição dos projetos cadastrados',
              style: TextStyle(fontSize: 11, color: AppColors.muted)),
          const SizedBox(height: 21),
          Center(
            child: SizedBox(
              width: 157,
              height: 157,
              child: Stack(alignment: Alignment.center, children: [
                SizedBox.expand(child: CircularProgressIndicator(
                  value: rate,
                  strokeWidth: 13,
                  strokeCap: StrokeCap.round,
                  backgroundColor: AppColors.surfaceLight,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                )),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('${(rate * 100).round()}%', style: const TextStyle(
                    fontSize: 31, fontWeight: FontWeight.w900, letterSpacing: -1,
                  )),
                  const Text('concluídos', style: TextStyle(
                    fontSize: 11, color: AppColors.muted,
                  )),
                ]),
              ]),
            ),
          ),
          const SizedBox(height: 27),
          Row(children: [
            const _LegendDot(color: AppColors.accent),
            const SizedBox(width: 7),
            const Expanded(child: Text('Concluídos', style: TextStyle(
              color: AppColors.muted, fontSize: 11,
            ))),
            Text('${PortfolioData.completedProjects}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            const _LegendDot(color: AppColors.blue),
            const SizedBox(width: 7),
            const Expanded(child: Text('Em andamento', style: TextStyle(
              color: AppColors.muted, fontSize: 11,
            ))),
            Text('${PortfolioData.activeProjects}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
          ]),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    height: 9, width: 9,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
  );
}
