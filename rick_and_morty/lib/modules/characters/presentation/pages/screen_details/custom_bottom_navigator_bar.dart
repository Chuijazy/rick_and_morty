import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff152A3A),
      selectedItemColor: const Color(0xff43D049),
      unselectedItemColor: const Color(0xff5B6975),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/ghost.png', width: 20, height: 18.8),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/planet.png', width: 20, height: 18.8),
          label: 'Locations',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/episode.png', width: 20, height: 18.8),
          label: 'Episodes',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/settings.png', width: 20, height: 18.8),
          label: 'Settings',
        ),
      ],
    );
  }
}
