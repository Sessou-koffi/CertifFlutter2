import 'package:flutter_test/flutter_test.dart';
import 'package:voyage_app/models/destination.dart';

void main() {
  test('Test unitaire du modele Destination', () {
    final dest = Destination(
      id: '1', title: 'Paris', country: 'France', description: 'Belle ville',
      imageUrl: 'assets/images/santorin1.jpg', pricePerNight: 100, rating: 4.5, activities: []
    );
    expect(dest.title, 'Paris');
    expect(dest.country, 'France');
  });
}
