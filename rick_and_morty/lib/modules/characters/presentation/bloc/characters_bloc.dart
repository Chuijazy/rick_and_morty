import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/modules/characters/data/model/repository/characters_list_repository.dart';
import 'characters_event.dart';
import 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersListRepository repository;

  CharactersBloc(this.repository) : super(CharactersInitial()) {
    on<LoadCharacters>((event, emit) async {
      emit(CharactersLoading());
      try {
        final characters = await repository.getAllCharacters();
        emit(CharactersLoaded(characters));
      } catch (e) {
        emit(CharactersError('Error loading characters: $e'));
      }
    });
  }
}
