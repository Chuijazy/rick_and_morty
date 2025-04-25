import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharactersEntity> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String message;
  CharactersError(this.message);
}
