class Destination {
  final String id;
  final String title;
  final String country;
  final String description;
  final String imageUrl;
  final double pricePerNight;
  final double rating;
  final List<String> activities;
  final bool isPopular;

  Destination({
    required this.id,
    required this.title,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.pricePerNight,
    required this.rating,
    required this.activities,
    this.isPopular = false,
  });
}
