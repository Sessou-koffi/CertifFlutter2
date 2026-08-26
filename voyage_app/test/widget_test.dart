import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/models/destination.dart';
import 'package:voyage_app/data/destination_data.dart';
import 'package:voyage_app/widgets/custom_input.dart';

void main() {
  group('Tests Unitaires - Modèle et Données', () {
    test('Le modèle Destination doit s\'instancier correctement', () {
      final destination = Destination(
        id: '99',
        title: 'Test Ville',
        country: 'Test Pays',
        description: 'Une description de test de plus de quelques mots.',
        imageUrl: 'assets/images/santorin1.jpg',
        pricePerNight: 100.0,
        rating: 4.5,
        activities: ['Activité 1'],
        isPopular: true,
      );
      expect(destination.id, '99');
      expect(destination.title, 'Test Ville');
    });

    test('La liste de données statiques doit contenir 5 destinations', () {
      expect(DestinationData.sampleDestinations.length, 5);
    });
  });

  group('Tests UI - Widgets Réutilisables', () {
    testWidgets('Le widget CustomInput doit afficher son label et son hint', (WidgetTester tester) async {
      final controller = TextEditingController();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: CustomInput(
                controller: controller,
                label: 'Mon Label',
                hint: 'Mon Hint',
                icon: Icons.person,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Mon Label'), findsOneWidget);
      expect(find.text('Mon Hint'), findsOneWidget);
    });
  });
}
