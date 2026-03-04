import '../models/trek.dart';

final List<Trek> dummyTreks = [
  Trek(
    id: '1',
    locationName: 'Talakona Waterfalls Trail',
    description:
        'A lush forest path that leads to the tallest waterfall in Andhra Pradesh.',
    difficulty: 'Moderate',
    distanceKm: 8.5,
    date: DateTime(2026, 1, 14),
    imageUrls: [
      'https://images.unsplash.com/photo-1448375240586-882707db888b',
      'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
      'https://images.unsplash.com/photo-1472396961693-142e6e269027',
    ],
    mapLabel: 'Talakona, Tirupati Region',
    experienceNotes:
        'Great for beginners with beautiful misty viewpoints after sunrise.',
  ),
  Trek(
    id: '2',
    locationName: 'Tumburu Theertham Trek',
    description:
        'A sacred and adventurous trek through dense woods and rocky patches.',
    difficulty: 'Hard',
    distanceKm: 12.2,
    date: DateTime(2026, 2, 3),
    imageUrls: [
      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b',
      'https://images.unsplash.com/photo-1454496522488-7a8e488e8606',
      'https://images.unsplash.com/photo-1431794062232-2a99a5431c6c',
    ],
    mapLabel: 'Tumburu, Tirumala Hills',
    experienceNotes:
        'Carry water and start early; trail is long but deeply rewarding.',
  ),
];
