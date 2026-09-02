import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/widgets/custom_input.dart';

void main() {
  testWidgets('Test du widget CustomInput', (WidgetTester tester) async {
    final ctrl = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: Form(child: CustomInput(controller: ctrl, label: 'Nom', hint: 'Saisir', icon: Icons.input)))
    ));
    expect(find.text('Nom'), findsOneWidget);
  });
}
