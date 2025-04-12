import 'package:rick_and_morty/modules/characters/domain/entity/characters_entity.dart';

abstract class CharactersListDomainRepository {
  Future<List<CharactersEntity>> getAllCharacters();
}
