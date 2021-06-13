import 'package:pokemon_app/data/datasources/CharactersDataSource.dart';
import 'package:pokemon_app/data/domain/Character.dart';

class CharactersRepository {
  CharactersDataSource charactersDataSource;

  CharactersRepository({required this.charactersDataSource});

  Future<List<Character>> getAllCharacters() {
    return charactersDataSource.getAllCharacters();
  }
}
