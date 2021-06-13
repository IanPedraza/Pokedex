import 'package:pokemon_app/data/domain/Character.dart';

abstract class CharactersDataSource {
  Future<List<Character>> getAllCharacters();
}
