import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GREEN TRAIL TREKKERS – Tirupati',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Moto: Go Where You Feel Most Alive',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 18),
            const Text(
              'We are a trekking community of explorers who discover nature trails '
              'around Tirupati, share experiences, preserve local ecosystems, and '
              'inspire safe adventure for everyone.',
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.forest, color: Colors.green),
                SizedBox(width: 8),
                Text('Nature first • Leave no trace'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
