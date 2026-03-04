# GREEN TRAIL TREKKERS – Tirupati

**Moto:** _Go Where You Feel Most Alive_

A modern cross-platform Flutter mobile application for trekking enthusiasts to explore trails, view trekking galleries, and add their own experiences.

## Features Implemented

- Nature-inspired green UI theme with rounded cards and smooth transitions.
- Home screen with app branding, moto, and recent trekking cards.
- Trek Details screen with image slider, trek metadata, notes, and map placeholder.
- Gallery screen with grid layout, Hero animation, and full-screen zoom preview.
- Add New Trek screen with complete form and validation.
- Floating Action Button (`+ Add Trek`) on home screen.
- Bottom navigation: Home, Treks, Gallery, Profile/About.
- About screen with community description.
- Dummy trek data preloaded for demonstration.
- Modular and scalable folder structure.

## Project Structure

```text
lib/
  core/
    theme/
      app_theme.dart
  data/
    models/
      trek.dart
    repositories/
      trek_repository.dart
    sample/
      dummy_treks.dart
  presentation/
    providers/
      trek_provider.dart
    screens/
      about_screen.dart
      add_trek_screen.dart
      gallery_screen.dart
      home_screen.dart
      main_shell.dart
      trek_details_screen.dart
      treks_screen.dart
    widgets/
      trek_card.dart
  main.dart
```

## Run Instructions

1. Install Flutter SDK (stable channel) and verify setup:
   ```bash
   flutter doctor
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app (Android/iOS simulator or real device):
   ```bash
   flutter run
   ```

## Notes

- Current data layer uses local in-memory dummy data.
- Map section is implemented as a placeholder and ready for Google Maps integration.
- Upload Photos field accepts comma-separated image URLs in this demo.
- Architecture is prepared for extension to Firebase, authentication, and offline storage.
