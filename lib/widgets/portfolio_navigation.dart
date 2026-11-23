import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

const sectionNames = <String>[
  'Dashboard',
  'Projetos',
  'Habilidades',
  'Sobre mim',
];

const sectionIcons = <IconData>[
  Icons.dashboard_rounded,
  Icons.grid_view_rounded,
  Icons.auto_awesome_rounded,
  Icons.person_outline_rounded,
];

class PortfolioSidebar extends StatelessWidget {
  const PortfolioSidebar({
    super.key,
    required this.activeIndex,
    required this.onSelect,
  });

  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252,
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 24),
      decoration: const BoxDecoration(
        color: AppColors.sidebar,
        border: Border(right: BorderSide(color: AppColors.outline)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Brand(),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.only(left: 14, bottom: 15),
            child: Text('MENU PRINCIPAL', style: TextStyle(
              color: AppColors.muted,
              fontWeight: FontWeight.w800,
              fontSize: 10,
              letterSpacing: 1.8,
            )),
          ),
          for (var i = 0; i < sectionNames.length; i++) ...[
            _SidebarItem(
              title: sectionNames[i],
              icon: sectionIcons[i],
              selected: activeIndex == i,
              onTap: () => onSelect(i),
            ),
            const SizedBox(height: 7),
          ],
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.outline),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.terminal_rounded, color: AppColors.accent, size: 23),
                SizedBox(height: 11),
                Text('Feito com Flutter', style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 13,
                )),
                SizedBox(height: 5),
                Text('Interface web • Dados de demonstração',
                    style: TextStyle(color: AppColors.muted, fontSize: 11, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('DEVFOLIO / 2026', style: TextStyle(
            color: AppColors.muted, fontSize: 10, letterSpacing: 1.2,
          )),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 43,
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(Icons.code_rounded, color: AppColors.background, size: 24),
        ),
        const SizedBox(width: 11),
        const Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('devfolio', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w900, letterSpacing: -1)),
            Text('PAINEL DE PORTFÓLIO', style: TextStyle(color: AppColors.muted,
                fontSize: 8, fontWeight: FontWeight.w700, letterSpacing: 1.1)),
          ],
        )),
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.accent.withAlpha(28) : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: selected
                ? AppColors.accent.withAlpha(56) : Colors.transparent),
          ),
          child: Row(children: [
            Icon(icon, size: 20, color: selected ? AppColors.accent : AppColors.muted),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: TextStyle(
              fontSize: 13, fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              color: selected ? AppColors.accent : AppColors.muted,
            ))),
            if (selected) const Icon(Icons.circle, color: AppColors.accent, size: 7),
          ]),
        ),
      ),
    );
  }
}

class MobileNavigation extends StatelessWidget {
  const MobileNavigation({
    super.key,
    required this.activeIndex,
    required this.onSelect,
  });

  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (var i = 0; i < sectionNames.length; i++) ...[
          ChoiceChip(
            showCheckmark: false,
            selected: activeIndex == i,
            onSelected: (_) => onSelect(i),
            avatar: Icon(sectionIcons[i], size: 16,
                color: activeIndex == i ? AppColors.background : AppColors.muted),
            label: Text(sectionNames[i]),
            selectedColor: AppColors.accent,
            backgroundColor: AppColors.surface,
            labelStyle: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 12, color: activeIndex == i
                    ? AppColors.background : AppColors.muted),
            side: const BorderSide(color: AppColors.outline),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          ),
          const SizedBox(width: 8),
        ],
      ]),
    );
  }
}
