import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/characters/data/model/repository/characters_list_repository.dart';
import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';
import 'package:rick_and_morty/modules/characters/presentation/pages/screen_details/custom_bottom_navigator_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharactersEntity> charactersList = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchCharacter = '';

  @override
  void initState() {
    super.initState();
    getAllCharacters();
    _searchController.addListener(() {
      setState(() {
        _searchCharacter = _searchController.text.toLowerCase();
      });
    });
  }

  Future<void> getAllCharacters() async {
    final repo = CharactersListRepository();
    charactersList = await repo.getAllCharacters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filteredCharacters =
        charactersList.where((character) {
          return character.name.toLowerCase().contains(_searchCharacter);
        }).toList();

    return Scaffold(
      backgroundColor: const Color(0xff0B1E2D),
      appBar: AppBar(
        backgroundColor: const Color(0xff0B1E2D),
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search character...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: filteredCharacters.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Text(
                  'Total Characters: 20',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            final character = filteredCharacters[index - 1];
            final statusColor =
                character.status.toLowerCase() == 'unknown'
                    ? Colors.grey
                    : character.status.toLowerCase() == 'alive'
                    ? Colors.green
                    : Colors.red;

            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(character.image),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                character.status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${character.species}, ${character.gender}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
