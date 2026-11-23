import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'widgets/about_section.dart';
import 'widgets/intro_banner.dart';
import 'widgets/metric_dashboard.dart';
import 'widgets/portfolio_navigation.dart';
import 'widgets/profile_badge.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio | Portfólio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const _PortfolioHome(),
    );
  }
}

class _PortfolioHome extends StatefulWidget {
  const _PortfolioHome();

  @override
  State<_PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<_PortfolioHome> {
  final _sectionKeys = List<GlobalKey>.generate(4, (_) => GlobalKey());
  int _activeIndex = 0;

  void _goTo(int index) {
    setState(() => _activeIndex = index);
    final target = _sectionKeys[index].currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeInOutCubic,
        alignment: .06,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final desktop = constraints.maxWidth >= 1060;
      final horizontalPadding = constraints.maxWidth < 620 ? 16.0 : 32.0;

      return Scaffold(
        body: SafeArea(
          child: Row(children: [
            if (desktop)
              PortfolioSidebar(activeIndex: _activeIndex, onSelect: _goTo),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1380),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(horizontalPadding, 24,
                          horizontalPadding, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _PageHeader(),
                          if (!desktop) ...[
                            const SizedBox(height: 19),
                            MobileNavigation(
                              activeIndex: _activeIndex,
                              onSelect: _goTo,
                            ),
                          ],
                          const SizedBox(height: 24),
                          LayoutBuilder(builder: (context, layout) {
                            if (layout.maxWidth >= 825) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 6, child: IntroBanner(
                                    onExplore: () => _goTo(1),
                                  )),
                                  const SizedBox(width: 16),
                                  const Expanded(flex: 5, child: ProfileBadge()),
                                ],
                              );
                            }
                            return Column(children: [
                              IntroBanner(onExplore: () => _goTo(1)),
                              const SizedBox(height: 16),
                              const ProfileBadge(),
                            ]);
                          }),
                          const SizedBox(height: 38),
                          Container(
                            key: _sectionKeys[0],
                            child: const MetricDashboard(),
                          ),
                          const SizedBox(height: 47),
                          Container(
                            key: _sectionKeys[1],
                            child: const ProjectsSection(),
                          ),
                          const SizedBox(height: 47),
                          Container(
                            key: _sectionKeys[2],
                            child: const SkillsSection(),
                          ),
                          const SizedBox(height: 47),
                          Container(
                            key: _sectionKeys[3],
                            child: const AboutSection(),
                          ),
                          const SizedBox(height: 34),
                          const Divider(color: AppColors.outline),
                          const SizedBox(height: 14),
                          const _PageFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 15,
      children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('PAINEL PESSOAL', style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w800,
            color: AppColors.accent, letterSpacing: 1.6,
          )),
          SizedBox(height: 5),
          Text('Meu DevFolio', style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: -.8,
          )),
          SizedBox(height: 3),
          Text('Minha evolução em cada linha de código.',
              style: TextStyle(color: AppColors.muted, fontSize: 12)),
        ]),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.outline),
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.info_outline_rounded, size: 16, color: AppColors.amber),
            SizedBox(width: 8),
            Text('DADOS DE DEMONSTRAÇÃO', style: TextStyle(
              fontSize: 10, color: AppColors.muted, fontWeight: FontWeight.w800,
              letterSpacing: .6,
            )),
          ]),
        ),
      ],
    );
  }
}

class _PageFooter extends StatelessWidget {
  const _PageFooter();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 20,
      runSpacing: 12,
      children: [
        Text('© 2026 DevFolio • Feito com Flutter e Dart', style: TextStyle(
          color: AppColors.muted, fontSize: 11,
        )),
        Text('Personalize os dados em lib/data/portfolio_data.dart',
            style: TextStyle(color: AppColors.muted, fontSize: 11)),
      ],
    );
  }
}
