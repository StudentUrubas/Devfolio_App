import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'surface_card.dart';

class VisitsChart extends StatefulWidget {
  const VisitsChart({super.key});

  @override
  State<VisitsChart> createState() => _VisitsChartState();
}

class _VisitsChartState extends State<VisitsChart> {
  bool _monthly = false;

  @override
  Widget build(BuildContext context) {
    final values = _monthly
        ? PortfolioData.monthlyVisits : PortfolioData.weeklyVisits;
    final labels = _monthly
        ? PortfolioData.monthlyLabels : PortfolioData.weeklyLabels;

    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 14,
            runSpacing: 14,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visitas ao portfólio', style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 16,
                  )),
                  SizedBox(height: 6),
                  Text('Dados ilustrativos • não são acessos reais', style: TextStyle(
                    color: AppColors.muted, fontSize: 11,
                  )),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(color: AppColors.outline),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  _PeriodButton(
                    title: 'Semana',
                    selected: !_monthly,
                    onTap: () => setState(() => _monthly = false),
                  ),
                  _PeriodButton(
                    title: 'Mês',
                    selected: _monthly,
                    onTap: () => setState(() => _monthly = true),
                  ),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Semantics(
            label: 'Gráfico de visitas ilustrativas: ${values.map((v) => v.toInt()).join(', ')}',
            child: SizedBox(
              height: 174,
              width: double.infinity,
              child: CustomPaint(painter: _SmoothChartPainter(values: values)),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels.map((label) => Text(
              label, style: const TextStyle(color: AppColors.muted, fontSize: 10),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _PeriodButton extends StatelessWidget {
  const _PeriodButton({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.surfaceLight : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Text(title, style: TextStyle(
            fontSize: 11,
            color: selected ? AppColors.foreground : AppColors.muted,
            fontWeight: FontWeight.w700,
          )),
        ),
      ),
    );
  }
}

class _SmoothChartPainter extends CustomPainter {
  const _SmoothChartPainter({required this.values});

  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || size.isEmpty) return;
    final bottom = size.height - 9;
    const top = 10.0;
    final gridPaint = Paint()
      ..color = AppColors.outline.withAlpha(204)
      ..strokeWidth = 1;

    for (var i = 0; i < 4; i++) {
      final y = top + (bottom - top) / 3 * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final maxValue = math.max(1.0, values.reduce(math.max) * 1.15);
    final lastIndex = values.length - 1;
    final points = <Offset>[];
    for (var i = 0; i < values.length; i++) {
      final x = lastIndex == 0 ? size.width / 2 : size.width * i / lastIndex;
      final y = bottom - values[i] / maxValue * (bottom - top);
      points.add(Offset(x, y));
    }

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      final previous = points[i - 1];
      final point = points[i];
      final middleX = (previous.dx + point.dx) / 2;
      path.cubicTo(middleX, previous.dy, middleX, point.dy, point.dx, point.dy);
    }

    final area = Path.from(path)
      ..lineTo(points.last.dx, bottom)
      ..lineTo(points.first.dx, bottom)
      ..close();
    canvas.drawPath(area, Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.accent.withAlpha(64), AppColors.accent.withAlpha(0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
    canvas.drawPath(path, Paint()
      ..color = AppColors.accent
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke);

    for (final point in points) {
      canvas.drawCircle(point, 4, Paint()..color = AppColors.background);
      canvas.drawCircle(point, 3, Paint()..color = AppColors.accent);
    }
  }

  @override
  bool shouldRepaint(covariant _SmoothChartPainter oldDelegate) =>
      oldDelegate.values != values;
}
