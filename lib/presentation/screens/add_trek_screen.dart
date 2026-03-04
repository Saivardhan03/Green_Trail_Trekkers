import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/trek_provider.dart';

class AddTrekScreen extends StatefulWidget {
  const AddTrekScreen({super.key});

  @override
  State<AddTrekScreen> createState() => _AddTrekScreenState();
}

class _AddTrekScreenState extends State<AddTrekScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _distanceController = TextEditingController();
  final _photosController = TextEditingController();
  String _difficulty = 'Easy';
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _locationController.dispose();
    _descriptionController.dispose();
    _distanceController.dispose();
    _photosController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final photos = _photosController.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    context.read<TrekProvider>().addTrek(
          locationName: _locationController.text.trim(),
          description: _descriptionController.text.trim(),
          difficulty: _difficulty,
          distanceKm: double.parse(_distanceController.text.trim()),
          date: _selectedDate,
          photoUrls: photos.isEmpty
              ? ['https://images.unsplash.com/photo-1464822759023-fed622ff2c3b']
              : photos,
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Trek added successfully!')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Trek')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Trek Location Name'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Please enter location name'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Please enter description'
                    : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _difficulty,
                items: const ['Easy', 'Moderate', 'Hard']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() => _difficulty = value ?? 'Easy'),
                decoration: const InputDecoration(labelText: 'Difficulty Level'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _distanceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Distance (km)'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter distance';
                  }
                  return double.tryParse(value.trim()) == null
                      ? 'Enter a valid number'
                      : null;
                },
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date'),
                subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: _pickDate,
                ),
              ),
              TextFormField(
                controller: _photosController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Upload Photos (comma-separated image URLs)',
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.hiking),
                label: const Text('Add Trek'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
