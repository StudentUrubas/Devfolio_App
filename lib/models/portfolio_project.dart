import 'package:flutter/material.dart';

enum ProjectStatus { completed, inProgress }

extension ProjectStatusLabel on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.completed:
        return 'Concluído';
      case ProjectStatus.inProgress:
        return 'Em andamento';
    }
  }
}

class PortfolioProject {
  const PortfolioProject({
    required this.title,
    required this.description,
    required this.category,
    required this.technologies,
    required this.status,
    required this.icon,
    required this.color,
    required this.period,
  });

  final String title;
  final String description;
  final String category;
  final List<String> technologies;
  final ProjectStatus status;
  final IconData icon;
  final Color color;
  final String period;
}

class SkillItem {
  const SkillItem({
    required this.name,
    required this.level,
    required this.icon,
    required this.color,
  });

  final String name;
  final double level;
  final IconData icon;
  final Color color;
}

class ActivityItem {
  const ActivityItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String date;
  final IconData icon;
}
