import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/modules/characters/data/model/repository/characters_list_repository.dart';
import 'package:rick_and_morty/modules/characters/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/characters/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty/modules/characters/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              CharactersBloc(CharactersListRepository())..add(LoadCharacters()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
