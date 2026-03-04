import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trek_provider.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photos = context
        .watch<TrekProvider>()
        .treks
        .expand((trek) => trek.imageUrls)
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final photo = photos[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _FullScreenPhoto(photoUrl: photo, tag: 'photo-$index'),
              ),
            ),
            child: Hero(
              tag: 'photo-$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(photo, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FullScreenPhoto extends StatelessWidget {
  const _FullScreenPhoto({required this.photoUrl, required this.tag});

  final String photoUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, foregroundColor: Colors.white),
      body: Center(
        child: InteractiveViewer(
          child: Hero(tag: tag, child: Image.network(photoUrl)),
        ),
      ),
    );
  }
}
