import 'package:pokemon_app/data/domain/Character.dart';
import 'package:pokemon_app/data/repositories/CharactersRepository.dart';

class GetAllCharactersUseCase {
  final CharactersRepository charactersRepository;

  GetAllCharactersUseCase({required this.charactersRepository});

  Future<List<Character>> invoke() {
    return charactersRepository.getAllCharacters();
  }

}
