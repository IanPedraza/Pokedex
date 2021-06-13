import 'package:pokemon_app/data/datasources/CharactersDataSource.dart';
import 'package:pokemon_app/data/domain/Character.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/data/domain/CharactersResponse.dart';

class PokeApiCharactersDataSource extends CharactersDataSource {
  final baseUrl = "https://pokeapi.co/api/v2/";

  @override
  Future<List<Character>> getAllCharacters() async {
    String url = '${baseUrl}pokemon?limit=10000';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = CharactersResponse.fromJson(response.body);

      return data.results.map((character) {
        final params = character.url.split("/");
        final characterId = params[params.length - 2];

        final imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${characterId}.png";

        character.imageUrl = imageUrl;
        return character;
      }).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
