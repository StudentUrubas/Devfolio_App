import 'package:flutter_test/flutter_test.dart';
import 'package:devfolio_app/data/portfolio_data.dart';
import 'package:devfolio_app/models/portfolio_project.dart';

void main() {
  test('todos os projetos são contabilizados corretamente', () {
    expect(PortfolioData.totalProjects, PortfolioData.projects.length);
    expect(PortfolioData.completedProjects + PortfolioData.activeProjects,
        PortfolioData.totalProjects);
  });

  test('taxa de conclusão acompanha o status dos projetos', () {
    final completed = PortfolioData.projects
        .where((project) => project.status == ProjectStatus.completed)
        .length;
    expect(PortfolioData.completionRate,
        completed / PortfolioData.totalProjects);
  });

  test('os rótulos do gráfico correspondem à quantidade de valores', () {
    expect(PortfolioData.weeklyLabels.length,
        PortfolioData.weeklyVisits.length);
    expect(PortfolioData.monthlyLabels.length,
        PortfolioData.monthlyVisits.length);
  });
});
