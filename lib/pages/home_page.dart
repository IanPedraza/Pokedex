import 'package:flutter/material.dart';
import 'package:pokemon_app/components/ListOfCharacters.dart';
import 'package:pokemon_app/components/SearchBar.dart';
import 'package:pokemon_app/data/datasources/CharactersDataSource.dart';
import 'package:pokemon_app/data/domain/Character.dart';
import 'package:pokemon_app/data/framework/PokeAPI/PokeApiDataSource.dart';
import 'package:pokemon_app/data/repositories/CharactersRepository.dart';
import 'package:pokemon_app/data/usecases/GetAllCharactersUseCase.dart';
import 'package:pokemon_app/utils/arguments.dart';
import 'package:pokemon_app/utils/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> _characters = List.empty();
  List<Character> _filteredCharacters = List.empty();

  late CharactersDataSource _charactersDataSource =
      PokeApiCharactersDataSource();

  late CharactersRepository _charactersRepository =
      CharactersRepository(charactersDataSource: _charactersDataSource);

  late GetAllCharactersUseCase _getAllCharactersUseCase =
      GetAllCharactersUseCase(charactersRepository: _charactersRepository);

  @override
  void initState() {
    super.initState();
    getAllCharacters();
  }

  void getAllCharacters() {
    _getAllCharactersUseCase.invoke().then((charactersList) => {
          this.setState(() {
            _characters = charactersList;
            _filteredCharacters = charactersList;
          })
        });
  }

  void handleSearch(String query) {
    setState(() {
      _filteredCharacters = _characters
          .where((character) =>
              character.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    });
  }

  void handleOnTapItem(Character character) {
    final arguments = {character_arg: character};
    Navigator.pushNamed(context, character_detail_route, arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            SearchBar(
              onChanged: handleSearch,
            ),
            Expanded(
                child: ListOfCharacters(
              characters: _filteredCharacters,
              onTap: handleOnTapItem,
            )),
          ],
        ));
  }
}
