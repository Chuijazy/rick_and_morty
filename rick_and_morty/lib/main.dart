import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/home/home_screen.dart';

void main() {
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}
