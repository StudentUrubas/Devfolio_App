import 'package:flutter/material.dart';

import '../models/portfolio_project.dart';

/// Dados de demonstração. Personalize estas informações antes da entrega.
class PortfolioData {
  const PortfolioData._();

  static const name = 'Seu Nome';
  static const initials = 'SN';
  static const username = '@seuusuario';
  static const role = 'Desenvolvedor(a) Flutter';
  static const location = 'São Paulo, Brasil';
  static const email = 'contato@exemplo.com';
  static const github = 'github.com/seu-usuario';
  static const badgeId = 'DEV-2026-001';
  static const about =
      'Sou uma pessoa apaixonada por tecnologia e desenvolvimento de software. '
      'Gosto de transformar problemas reais em interfaces bonitas, acessíveis '
      'e funcionais. Este portfólio reúne alguns projetos e habilidades.';

  static const projects = <PortfolioProject>[
    PortfolioProject(
      title: 'DevFolio App',
      description: 'Portfólio responsivo com crachá digital, métricas e projetos.',
      category: 'Aplicativo Web',
      technologies: ['Flutter', 'Dart', 'Material 3'],
      status: ProjectStatus.inProgress,
      icon: Icons.space_dashboard_rounded,
      color: Color(0xFFB5F5D0),
      period: '2026',
    ),
    PortfolioProject(
      title: 'TaskFlow',
      description: 'Gerenciador de tarefas com filtros, prioridades e produtividade.',
      category: 'Produtividade',
      technologies: ['Flutter', 'Dart'],
      status: ProjectStatus.completed,
      icon: Icons.task_alt_rounded,
      color: Color(0xFFA6C7FF),
      period: '2026',
    ),
    PortfolioProject(
      title: 'FinTrack',
      description: 'Painel pessoal de despesas e receitas com visualizações.',
      category: 'Finanças',
      technologies: ['Flutter', 'Charts'],
      status: ProjectStatus.completed,
      icon: Icons.account_balance_wallet_outlined,
      color: Color(0xFFFFD89E),
      period: '2026',
    ),
    PortfolioProject(
      title: 'Weather UI',
      description: 'Interface de previsão do tempo, pensada para telas menores.',
      category: 'Interface Mobile',
      technologies: ['Dart', 'UI/UX'],
      status: ProjectStatus.completed,
      icon: Icons.wb_cloudy_outlined,
      color: Color(0xFFC2B7FF),
      period: '2025',
    ),
    PortfolioProject(
      title: 'Shop Catalog',
      description: 'Catálogo com busca por nome e organização por categorias.',
      category: 'Comércio',
      technologies: ['Flutter', 'Widgets'],
      status: ProjectStatus.completed,
      icon: Icons.shopping_bag_outlined,
      color: Color(0xFFFFB4B4),
      period: '2025',
    ),
    PortfolioProject(
      title: 'StudyHub',
      description: 'Espaço para organizar estudos, metas e progresso semanal.',
      category: 'Educação',
      technologies: ['Flutter', 'Dart'],
      status: ProjectStatus.inProgress,
      icon: Icons.menu_book_rounded,
      color: Color(0xFF9CE5E7),
      period: '2026',
    ),
  ];

  static const skills = <SkillItem>[
    SkillItem(name: 'Flutter', level: .90, icon: Icons.phone_iphone_rounded,
        color: Color(0xFF9EC9FF)),
    SkillItem(name: 'Dart', level: .85, icon: Icons.code_rounded,
        color: Color(0xFFB5F5D0)),
    SkillItem(name: 'UI / UX', level: .78, icon: Icons.palette_outlined,
        color: Color(0xFFCBB8FF)),
    SkillItem(name: 'Git e GitHub', level: .80, icon: Icons.alt_route_rounded,
        color: Color(0xFFFFCB9E)),
    SkillItem(name: 'Responsividade', level: .88, icon: Icons.devices_rounded,
        color: Color(0xFF9CE5E7)),
    SkillItem(name: 'APIs REST', level: .68, icon: Icons.hub_outlined,
        color: Color(0xFFFFABAC)),
  ];

  static const activities = <ActivityItem>[
    ActivityItem(
      title: 'Novo módulo do DevFolio',
      subtitle: 'Dashboard com métricas e gráficos demonstrativos.',
      date: 'Nov 2026',
      icon: Icons.auto_graph_rounded,
    ),
    ActivityItem(
      title: 'TaskFlow finalizado',
      subtitle: 'Fluxo de tarefas e filtros concluídos.',
      date: 'Out 2026',
      icon: Icons.check_circle_outline_rounded,
    ),
    ActivityItem(
      title: 'Projeto publicado',
      subtitle: 'Nova tela responsiva para o portfólio.',
      date: 'Set 2026',
      icon: Icons.rocket_launch_outlined,
    ),
  ];

  /// Visitas ilustrativas, não conectadas a analytics reais.
  static const weeklyVisits = <double>[42, 67, 59, 86, 74, 103, 124];
  static const weeklyLabels = <String>['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
  static const monthlyVisits = <double>[86, 119, 104, 150, 176, 211];
  static const monthlyLabels = <String>['Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov'];

  static int get totalProjects => projects.length;
  static int get completedProjects =>
      projects.where((project) => project.status == ProjectStatus.completed).length;
  static int get activeProjects => totalProjects - completedProjects;
  static int get totalSkills => skills.length;
  static double get completionRate =>
      totalProjects == 0 ? 0 : completedProjects / totalProjects;
}
