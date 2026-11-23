import 'package:flutter/material.dart';

import '../models/portfolio_project.dart';
import '../theme/app_theme.dart';
import 'surface_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    final completed = project.status == ProjectStatus.completed;

    return SurfaceCard(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: project.color.withAlpha(28),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(project.icon, color: project.color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(project.category.toUpperCase(), style: const TextStyle(
                color: AppColors.muted, fontSize: 9,
                fontWeight: FontWeight.w800, letterSpacing: 1,
              )),
              const SizedBox(height: 4),
              Text(project.title, maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            ],
          )),
          Text(project.period, style: const TextStyle(
            color: AppColors.muted, fontSize: 11,
          )),
        ]),
        const SizedBox(height: 17),
        Text(project.description, style: const TextStyle(
          color: AppColors.muted, fontSize: 12, height: 1.55,
        )),
        const SizedBox(height: 18),
        Wrap(spacing: 7, runSpacing: 7, children: [
          for (final tech in project.technologies)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(tech, style: const TextStyle(
                color: AppColors.foreground, fontSize: 10, fontWeight: FontWeight.w600,
              )),
            ),
        ]),
        const SizedBox(height: 19),
        const Divider(height: 1, color: AppColors.outline),
        const SizedBox(height: 14),
        Row(children: [
          Icon(completed ? Icons.check_circle_rounded : Icons.timelapse_rounded,
              size: 15, color: completed ? AppColors.accent : AppColors.amber),
          const SizedBox(width: 7),
          Text(project.status.label, style: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w700,
            color: completed ? AppColors.accent : AppColors.amber,
          )),
        ]),
      ]),
    );
  }
}
