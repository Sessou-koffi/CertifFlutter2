import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/widgets/activity_chip.dart';

void main() {
  testWidgets('Test du widget ActivityChip', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: ActivityChip(label: 'Randonnee')),
    ));
    expect(find.text('Randonnee'), findsOneWidget);
  });
}
