import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';

class CharactersInfoScreen extends StatelessWidget {
  final CharactersEntity character;

  const CharactersInfoScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size.height;
    final statusColor =
        character.status.toLowerCase() == 'unknown'
            ? Colors.grey
            : character.status.toLowerCase() == 'alive'
            ? Colors.green
            : Colors.red;
    return Scaffold(
      backgroundColor: const Color(0xff0B1E2D),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: mQ / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: double.infinity,
                height: mQ / 4,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: mQ / 4,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: mQ / 4 - 50,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff0B1E2D), width: 5),
                image: DecorationImage(
                  image: NetworkImage(character.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: mQ / 2.7,
            left: 100,
            right: 10,
            child: Text(
              character.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: mQ / 2.4,
            left: 200,
            right: 10,
            child: Text(
              character.status,
              style: TextStyle(
                color: statusColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
