import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/data/destination_data.dart';

void main() {
  test('Test de la source de donnees statiques', () {
    expect(DestinationData.sampleDestinations.length, 5);
    expect(DestinationData.sampleDestinations.first.title, 'Santorin');
  });
}
