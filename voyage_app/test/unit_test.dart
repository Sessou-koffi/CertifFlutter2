import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/models/destination.dart';
import 'package:voyage_app/data/destination_data.dart';

void main() {
  group('Tests Unitaires - Modele et Donnees', () {
    test('Le modele Destination doit s\'instancier correctement', () {
      final destination = Destination(
        id: '99',
        title: 'Test Ville',
        country: 'Test Pays',
        description: 'Une description de test de plus de quelques mots.',
        imageUrl: 'assets/images/santorin1.jpg',
        pricePerNight: 100.0,
        rating: 4.5,
        activities: ['Activite 1'],
        isPopular: true,
      );
      expect(destination.id, '99');
      expect(destination.title, 'Test Ville');
    });

    test('La liste de donnees statiques doit contenir 5 destinations', () {
      expect(DestinationData.sampleDestinations.length, 5);
    });
  });
}
