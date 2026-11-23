import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:devfolio_app/app.dart';

void main() {
  testWidgets('mostra crachá e indicadores do dashboard', (tester) async {
    tester.view.physicalSize = const Size(1300, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DevFolioApp());
    expect(find.text('Crachá digital'), findsOneWidget);
    expect(find.text('Dashboard de métricas'), findsOneWidget);
    expect(find.text('Projetos entregues'), findsOneWidget);
  });

  testWidgets('aplica o filtro de projetos concluídos', (tester) async {
    tester.view.physicalSize = const Size(1300, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DevFolioApp());
    final chip = find.widgetWithText(ChoiceChip, 'Concluídos');
    await tester.ensureVisible(chip);
    await tester.tap(chip);
    await tester.pumpAndSettle();

    expect(find.text('TaskFlow'), findsOneWidget);
    expect(find.text('StudyHub'), findsNothing);
  });
}
