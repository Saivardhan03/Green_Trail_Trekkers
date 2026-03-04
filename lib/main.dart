import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/trek_provider.dart';
import 'presentation/screens/main_shell.dart';

void main() {
  runApp(const GreenTrailTrekkersApp());
}

class GreenTrailTrekkersApp extends StatelessWidget {
  const GreenTrailTrekkersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrekProvider(),
      child: MaterialApp(
        title: 'GREEN TRAIL TREKKERS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainShell(),
      ),
    );
  }
}
