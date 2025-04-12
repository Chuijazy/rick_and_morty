import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/characters/data/model/repository/characters_list_repository.dart';
import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharactersEntity> charactersList = [];
  Future<void> getAllCharacters() async {
    final repo = CharactersListRepository();
    charactersList = await repo.getAllCharacters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: charactersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(charactersList[index].image),
            title: Text(charactersList[index].name),
            subtitle: Text(charactersList[index].status),
          );
        },
      ),
    );
  }
}
