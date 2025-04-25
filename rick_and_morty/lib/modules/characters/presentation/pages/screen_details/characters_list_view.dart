import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';
import 'package:rick_and_morty/modules/characters/presentation/pages/characters_info_screen.dart';

class CharactersListView extends StatelessWidget {
  final List<CharactersEntity> characters;
  final String searchQuery;

  const CharactersListView({
    super.key,
    required this.characters,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/not_found.png', width: 200),
            const SizedBox(height: 5),
            const Text(
              'Character with this \n   name not found',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: characters.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          final isSearching = searchQuery.isNotEmpty;
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Text(
              isSearching ? 'Search Results' : 'Total Characters: 20',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }

        final character = characters[index - 1];
        final statusColor =
            character.status.toLowerCase() == 'unknown'
                ? Colors.grey
                : character.status.toLowerCase() == 'alive'
                ? Colors.green
                : Colors.red;

        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => CharactersInfoScreen(character: character),
              ),
            );
          },
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
    );
  }
}
