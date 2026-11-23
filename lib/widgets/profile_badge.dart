import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'surface_card.dart';

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key});

  Future<void> _copyEmail(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: PortfolioData.email));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('E-mail copiado para a área de transferência.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.badge_outlined, color: AppColors.accent, size: 20),
            const SizedBox(width: 9),
            const Expanded(child: Text('Crachá digital', style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 15,
            ))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(26),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text('DISPONÍVEL', style: TextStyle(
                color: AppColors.accent, fontSize: 9, fontWeight: FontWeight.w800,
                letterSpacing: .7,
              )),
            ),
          ]),
          const SizedBox(height: 20),
          Row(children: [
            Container(
              width: 66,
              height: 66,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: AppColors.accent,
              ),
              child: const Text(PortfolioData.initials, style: TextStyle(
                color: AppColors.background, fontSize: 23, fontWeight: FontWeight.w900,
              )),
            ),
            const SizedBox(width: 14),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(PortfolioData.name, style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w900,
                )),
                SizedBox(height: 5),
                Text(PortfolioData.role, style: TextStyle(
                  color: AppColors.muted, fontSize: 12,
                )),
                SizedBox(height: 5),
                Text(PortfolioData.username, style: TextStyle(
                  color: AppColors.accent, fontSize: 11,
                )),
              ],
            )),
          ]),
          const SizedBox(height: 18),
          const Divider(height: 1, color: AppColors.outline),
          const SizedBox(height: 17),
          const Wrap(spacing: 14, runSpacing: 8, children: [
            _BadgeDetail(icon: Icons.pin_drop_outlined, text: PortfolioData.location),
            _BadgeDetail(icon: Icons.fingerprint_rounded, text: PortfolioData.badgeId),
          ]),
          const SizedBox(height: 17),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _copyEmail(context),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.outline),
                foregroundColor: AppColors.foreground,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.copy_rounded, size: 17),
              label: const Text('Copiar e-mail', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeDetail extends StatelessWidget {
  const _BadgeDetail({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, color: AppColors.muted, size: 14),
      const SizedBox(width: 5),
      Text(text, style: const TextStyle(color: AppColors.muted, fontSize: 11)),
    ]);
  }
}
