import 'package:flutter/material.dart';

import '../../data/models/trek.dart';
import '../../data/repositories/trek_repository.dart';

class TrekProvider extends ChangeNotifier {
  TrekProvider({TrekRepository? repository})
      : _repository = repository ?? TrekRepository();

  final TrekRepository _repository;

  List<Trek> get treks => _repository.getAll();

  void addTrek({
    required String locationName,
    required String description,
    required String difficulty,
    required double distanceKm,
    required DateTime date,
    required List<String> photoUrls,
  }) {
    _repository.add(
      Trek(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        locationName: locationName,
        description: description,
        difficulty: difficulty,
        distanceKm: distanceKm,
        date: date,
        imageUrls: photoUrls,
        mapLabel: '$locationName, Tirupati',
        experienceNotes:
            'Added by community member. Keep trails clean and trek responsibly.',
      ),
    );
    notifyListeners();
  }
}
