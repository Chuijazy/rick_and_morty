import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/characters/presentation/pages/home_screen.dart';

void main() {
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0B1E2D),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff152A3A),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
