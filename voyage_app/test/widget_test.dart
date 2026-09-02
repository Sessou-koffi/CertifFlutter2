import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/models/destination.dart';
import 'package:voyage_app/data/destination_data.dart';
import 'package:voyage_app/widgets/custom_input.dart';

void main() {
  group('Tests Unitaires', () {
    test('Validation du modele', () {
      final dest = Destination(
        id: '1', title: 'Test', country: 'Test', description: 'Desc',
        imageUrl: 'assets/images/santorin1.jpg', pricePerNight: 50, rating: 4, activities: []
      );
      expect(dest.title, 'Test');
    });
    test('Donnees statiques', () {
      expect(DestinationData.sampleDestinations.length, 5);
    });
  });

  group('Tests UI Widgets', () {
    testWidgets('Validation du CustomInput', (WidgetTester tester) async {
      final ctrl = TextEditingController();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: Form(child: CustomInput(controller: ctrl, label: 'Nom', hint: 'Saisir', icon: Icons.input)))
      ));
      expect(find.text('Nom'), findsOneWidget);
    });
  });
}
