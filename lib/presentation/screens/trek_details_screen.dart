import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/trek.dart';

class TrekDetailsScreen extends StatelessWidget {
  const TrekDetailsScreen({super.key, required this.trek});

  final Trek trek;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(trek.locationName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: trek.imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Hero(
                    tag: '${trek.id}-$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(trek.imageUrls[index], fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Text(trek.description),
          const SizedBox(height: 8),
          Text('Distance: ${trek.distanceKm.toStringAsFixed(1)} km'),
          Text('Difficulty: ${trek.difficulty}'),
          Text('Date: ${DateFormat.yMMMMd().format(trek.date)}'),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.location_on),
            title: Text(trek.mapLabel),
            subtitle: const Text('Map integration placeholder for Google Maps pins'),
          ),
          const SizedBox(height: 8),
          Text(
            'Trek Experience Notes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(trek.experienceNotes),
          const SizedBox(height: 16),
          Text(
            'Photos',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: trek.imageUrls
                .map(
                  (url) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(url, width: 100, height: 100, fit: BoxFit.cover),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
