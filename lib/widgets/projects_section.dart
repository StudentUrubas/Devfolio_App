import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/portfolio_project.dart';
import '../theme/app_theme.dart';
import 'project_card.dart';
import 'section_header.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  ProjectStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final filtered = PortfolioData.projects.where((project) =>
        _filter == null || project.status == _filter).toList();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionHeader(
        eyebrow: 'Meu trabalho',
        title: 'Projetos em destaque',
        description: 'Explore os exemplos ou filtre por andamento.',
      ),
      const SizedBox(height: 20),
      Wrap(spacing: 9, runSpacing: 8, children: [
        _ProjectFilterChip(label: 'Todos', selected: _filter == null,
            onTap: () => setState(() => _filter = null)),
        _ProjectFilterChip(label: 'Concluídos',
            selected: _filter == ProjectStatus.completed,
            onTap: () => setState(() => _filter = ProjectStatus.completed)),
        _ProjectFilterChip(label: 'Em andamento',
            selected: _filter == ProjectStatus.inProgress,
            onTap: () => setState(() => _filter = ProjectStatus.inProgress)),
      ]),
      const SizedBox(height: 16),
      LayoutBuilder(builder: (context, constraints) {
        final columns = constraints.maxWidth >= 700 ? 2 : 1;
        const spacing = 16.0;
        final width = (constraints.maxWidth - (columns - 1) * spacing) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: filtered.map((project) =>
              SizedBox(width: width, child: ProjectCard(project: project))).toList(),
        );
      }),
    ]);
  }
}

class _ProjectFilterChip extends StatelessWidget {
  const _ProjectFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onTap(),
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.accent,
      side: BorderSide(color: selected ? AppColors.accent : AppColors.outline),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      labelStyle: TextStyle(
        color: selected ? AppColors.background : AppColors.muted,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    );
  }
}
