import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trek_provider.dart';
import '../widgets/trek_card.dart';
import 'trek_details_screen.dart';

class TreksScreen extends StatelessWidget {
  const TreksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final treks = context.watch<TrekProvider>().treks;

    return Scaffold(
      appBar: AppBar(title: const Text('All Treks')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final trek = treks[index];
          return TrekCard(
            trek: trek,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => TrekDetailsScreen(trek: trek)),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: treks.length,
      ),
    );
  }
}
