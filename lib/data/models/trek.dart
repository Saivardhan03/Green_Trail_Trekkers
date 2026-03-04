class Trek {
  Trek({
    required this.id,
    required this.locationName,
    required this.description,
    required this.difficulty,
    required this.distanceKm,
    required this.date,
    required this.imageUrls,
    required this.mapLabel,
    required this.experienceNotes,
  });

  final String id;
  final String locationName;
  final String description;
  final String difficulty;
  final double distanceKm;
  final DateTime date;
  final List<String> imageUrls;
  final String mapLabel;
  final String experienceNotes;
}
