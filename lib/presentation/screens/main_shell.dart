import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'gallery_screen.dart';
import 'home_screen.dart';
import 'treks_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  late final List<Widget> _pages = const [
    HomeScreen(),
    TreksScreen(),
    GalleryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.house_fill), label: 'Home'),
          NavigationDestination(icon: Icon(CupertinoIcons.map), label: 'Treks'),
          NavigationDestination(icon: Icon(CupertinoIcons.photo_on_rectangle), label: 'Gallery'),
          NavigationDestination(icon: Icon(CupertinoIcons.person_text_rectangle), label: 'Profile/About'),
        ],
      ),
    );
  }
}
