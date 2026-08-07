import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/models/destination.dart';
import 'package:voyage_app/data/destination_data.dart';

void main() {
  group('Tests Unitaires - Modèle de Données', () {
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
      expect(destination.pricePerNight, 100.0);
    });

    test('La liste statique DestinationData ne doit pas être vide', () {
      expect(DestinationData.sampleDestinations.isNotEmpty, true);
      expect(DestinationData.sampleDestinations.length, 5);
    });
  });
}
